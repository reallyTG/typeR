library(naniar)


### Name: add_n_miss
### Title: Add column containing number of missing data values
### Aliases: add_n_miss

### ** Examples


airquality %>% add_n_miss()
airquality %>% add_n_miss(Ozone, Solar.R)
airquality %>% add_n_miss(dplyr::contains("o"))





