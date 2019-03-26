library(trelliscopejs)


### Name: panel
### Title: Panel Wrapper Function Wrapper function to specify a plot object
###   for a panel for use in dplyr summarise()
### Aliases: panel

### ** Examples

## No test: 
library(rbokeh)
library(dplyr)
ggplot2::mpg %>%
  group_by(manufacturer, class) %>%
  summarise(
    panel = panel(
      figure(xlab = "City mpg", ylab = "Highway mpg") %>%
        ly_points(cty, hwy)))
## End(No test)



