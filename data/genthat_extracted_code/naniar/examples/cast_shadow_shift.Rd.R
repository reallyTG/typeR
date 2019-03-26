library(naniar)


### Name: cast_shadow_shift
### Title: Add a shadow and a shadow_shift column to a dataset
### Aliases: cast_shadow_shift

### ** Examples


airquality %>% cast_shadow_shift(Ozone)
airquality %>% cast_shadow_shift(Ozone,Temp)

airquality %>% cast_shadow_shift(dplyr::contains("o"))




