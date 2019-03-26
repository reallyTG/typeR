library(naniar)


### Name: impute_below_at
### Title: Scoped variants of 'impute_below'
### Aliases: impute_below_at

### ** Examples

# select variables starting with a particular string.
library(dplyr)
impute_below_at(airquality,
                .vars = c("Ozone", "Solar.R"))

impute_below_at(airquality,
                .vars = 1:2)
#'
impute_below_at(airquality,
                .vars = vars(Ozone))

## Not run: 
##D library(ggplot2)
##D airquality %>%
##D   bind_shadow() %>%
##D   impute_below_at(vars(Ozone, Solar.R)) %>%
##D   add_label_shadow() %>%
##D   ggplot(aes(x = Ozone,
##D              y = Solar.R,
##D              colour = any_missing)) +
##D          geom_point()
## End(Not run)




