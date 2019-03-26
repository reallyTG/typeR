library(naniar)


### Name: shadow_shift
### Title: Shift missing values to facilitate missing data
###   exploration/visualisation
### Aliases: shadow_shift

### ** Examples

airquality$Ozone
shadow_shift(airquality$Ozone)
library(dplyr)
airquality %>%
    mutate(Ozone_shift = shadow_shift(Ozone))




