library(naniar)


### Name: scoped-impute_mean
### Title: Scoped variants of 'impute_mean'
### Aliases: scoped-impute_mean impute_mean_all impute_mean_at
###   impute_mean_if

### ** Examples

# select variables starting with a particular string.
library(dplyr)
impute_mean_all(airquality)

impute_mean_at(airquality,
               .vars = c("Ozone", "Solar.R"))

impute_mean_at(airquality,
                .vars = vars(Ozone))

impute_mean_if(airquality,
                .predicate = is.numeric)

## Not run: 
##D library(ggplot2)
##D airquality %>%
##D   bind_shadow() %>%
##D   impute_mean_all() %>%
##D   add_label_shadow() %>%
##D   ggplot(aes(x = Ozone,
##D              y = Solar.R,
##D              colour = any_missing)) +
##D          geom_point()
## End(Not run)




