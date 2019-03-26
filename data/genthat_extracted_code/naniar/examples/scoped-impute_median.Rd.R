library(naniar)


### Name: scoped-impute_median
### Title: Scoped variants of 'impute_median'
### Aliases: scoped-impute_median impute_median_all impute_median_at
###   impute_median_if

### ** Examples

# select variables starting with a particular string.
library(dplyr)
impute_median_all(airquality)

impute_median_at(airquality,
               .vars = c("Ozone", "Solar.R"))

impute_median_at(airquality,
                .vars = vars(Ozone))

impute_median_if(airquality,
                .predicate = is.numeric)

## Not run: 
##D library(ggplot2)
##D airquality %>%
##D   bind_shadow() %>%
##D   impute_median_all() %>%
##D   add_label_shadow() %>%
##D   ggplot(aes(x = Ozone,
##D              y = Solar.R,
##D              colour = any_missing)) +
##D          geom_point()
## End(Not run)




