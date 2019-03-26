library(bsplus)


### Name: bs_set_data
### Title: Sets Bootstrap data- and aria- attributes.
### Aliases: bs_set_data bs_set_aria

### ** Examples

library("htmltools")
library("lubridate")

tags$div() %>%
  bs_set_data(
    target = "#foobar",
    delay = dseconds(1),
    placement = c("right", "auto")
  ) %>%
  bs_set_aria(expanded = FALSE)



