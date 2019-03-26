library(trelliscopejs)


### Name: cogs
### Title: Cogs Wrapper Function
### Aliases: cogs

### ** Examples

## No test: 
library(dplyr)
library(tidyr)
library(rbokeh)
ggplot2::mpg %>%
  group_by(manufacturer, class) %>%
  nest() %>%
  mutate(
    additional_cogs = map_cog(data,
      ~ data_frame(
        max_city_mpg = cog(max(.x$cty), desc = "Max city mpg"),
        min_city_mpg = cog(min(.x$cty), desc = "Min city mpg"))),
    panel = map_plot(data, ~ figure(xlab = "City mpg", ylab = "Highway mpg") %>%
      ly_points(cty, hwy, data = .x))) %>%
  trelliscope(name = "city_vs_highway_mpg", nrow = 1, ncol = 2)
## End(No test)



