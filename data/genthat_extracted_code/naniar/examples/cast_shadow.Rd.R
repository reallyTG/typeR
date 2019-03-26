library(naniar)


### Name: cast_shadow
### Title: Add a shadow column to a dataset
### Aliases: cast_shadow

### ** Examples


airquality %>% cast_shadow(Ozone)
airquality %>% cast_shadow(Ozone, Solar.R)
library(ggplot2)
library(magrittr)
airquality  %>%
  cast_shadow(Ozone,Solar.R) %>%
  ggplot(aes(x = Ozone,
             colour = Solar.R_NA)) +
        geom_density()




