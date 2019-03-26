library(naniar)


### Name: add_label_shadow
### Title: Add a column describing whether there is a shadow
### Aliases: add_label_shadow

### ** Examples


airquality %>%
  add_shadow(Ozone, Solar.R) %>%
  add_label_shadow()




