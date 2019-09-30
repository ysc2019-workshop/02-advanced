library(tidyverse)

ratings <- readr::read_csv(here::here("data/ratings.csv"))

series <- sort(unique(ratings$series))
params <- map(series, ~list(series = .x))

paths <- paste0("series-", series)

walk2(paths, params, 
      ~ rmarkdown::render("02-bakeoff-finales.Rmd",
                          output_file = .x,
                          params = .y))
