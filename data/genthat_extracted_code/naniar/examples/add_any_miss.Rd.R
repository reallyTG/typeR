library(naniar)


### Name: add_any_miss
### Title: Add a column describing presence of any missing values
### Aliases: add_any_miss

### ** Examples


airquality %>% add_any_miss()
airquality %>% add_any_miss(Ozone)
airquality %>% add_any_miss(Ozone, Solar.R)




