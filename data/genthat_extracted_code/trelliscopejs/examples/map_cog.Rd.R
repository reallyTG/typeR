library(trelliscopejs)


### Name: map_cog
### Title: Apply a function to each element of a vector and return a vector
###   of cognostics data frames
### Aliases: map_cog

### ** Examples

## No test: 
library(dplyr)
library(tidyr)
library(rbokeh)
ggplot2::mpg %>%
  group_by(manufacturer, class) %>%
  nest() %>%
  mutate(panel = map_plot(data,
    ~ figure(xlab = "City mpg", ylab = "Highway mpg") %>%
        ly_points(cty, hwy, data = .x))) %>%
  trelliscope(name = "city_vs_highway_mpg")
## End(No test)



