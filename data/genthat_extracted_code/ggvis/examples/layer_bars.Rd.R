library(ggvis)


### Name: layer_bars
### Title: Display data with bars (a barchart).
### Aliases: layer_bars

### ** Examples

# Discrete x: bar graph of counts at each x value
cocaine %>% ggvis(~state) %>% layer_bars()
# Continuous x: bar graph of counts at unique locations
cocaine %>% ggvis(~month) %>% layer_bars()

# Use y prop to weight by additional variable. This is also useful
# if you have pretabulated data
cocaine %>% ggvis(~state, ~weight) %>% layer_bars()
cocaine %>% ggvis(~month, ~weight) %>% layer_bars()

# For continuous x, layer_bars is useful when the variable has a few
# unique values that you want to preserve. If you have many unique
# values and you want to bin, use layer_histogram
cocaine %>% ggvis(~price) %>% layer_bars()
cocaine %>% ggvis(~price) %>% layer_histograms(width = 100)

# If you have unique x values, you can use layer_bars() as an alternative
# to layer_points()
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# When x is continuous, width controls the width in x units
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars(width = 10)
# When x is categorical, width is proportional to spacing between bars
pressure %>% ggvis(~factor(temperature), ~pressure) %>%
  layer_bars(width = 0.5)

# Stacked bars
# If grouping var is continuous, you need to manually specify grouping
ToothGrowth %>% group_by(dose) %>%
  ggvis(x = ~supp, y = ~len, fill = ~dose) %>% layer_bars()
# If grouping var is categorical, grouping is done automatically
cocaine %>% ggvis(x = ~state, fill = ~as.factor(month)) %>%
  layer_bars()



