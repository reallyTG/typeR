library(trelliscopejs)


### Name: map_plot
### Title: Apply a function to each element of a vector and return a vector
###   of plots
### Aliases: map_plot

### ** Examples

## No test: 
library(dplyr)
library(tidyr)
library(purrr)
library(rbokeh)
library(gapminder)

# nest gapminder data by country
by_country <- gapminder %>%
  group_by(country, continent) %>%
  nest()

# add in a plot column with map_plot
by_country <- by_country %>% mutate(
  panel = map_plot(data,
    ~ figure(xlim = c(1948, 2011), ylim = c(10, 95), width = 300, tools = NULL) %>%
        ly_points(year, lifeExp, data = .x, hover = .x)
  ))

# plot it
by_country %>%
  trelliscope("gapminder", nrow = 2, ncol = 7)

# example using mpg data
ggplot2::mpg %>%
  group_by(manufacturer, class) %>%
  nest() %>%
  mutate(panel = map_plot(data,
    ~ figure(xlab = "City mpg", ylab = "Highway mpg") %>%
        ly_points(cty, hwy, data = .x))) %>%
  trelliscope(name = "city_vs_highway_mpg")
## End(No test)



