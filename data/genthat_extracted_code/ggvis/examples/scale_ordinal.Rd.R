library(ggvis)


### Name: scale_ordinal
### Title: Add a ordinal, nominal, or logical scale to a ggvis object.
### Aliases: scale_ordinal scale_nominal scale_logical

### ** Examples

p <- PlantGrowth %>% ggvis(~group, ~weight) %>% layer_points()

p
p %>% scale_nominal("x", padding = 0)
p %>% scale_nominal("x", padding = 1)

p %>% scale_nominal("x", reverse = TRUE)

p <- ToothGrowth %>% group_by(supp) %>%
  ggvis(~len, fill = ~supp) %>%
  layer_histograms(width = 4, stack = TRUE)

# Control range of fill scale
p %>% scale_nominal("fill", range = c("pink", "lightblue"))

# There's no default range when the data is categorical but the output range
# is continuous, as in the case of opacity. In these cases, you can
# manually specify the range for the scale.
mtcars %>% ggvis(x = ~wt, y = ~mpg, opacity = ~factor(cyl)) %>%
  layer_points() %>%
  scale_nominal("opacity", range = c(0.2, 1))



