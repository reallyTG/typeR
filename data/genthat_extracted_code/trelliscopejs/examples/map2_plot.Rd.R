library(trelliscopejs)


### Name: map2_plot
### Title: Map over multiple inputs simultaneously and return a vector of
###   plots
### Aliases: map2_plot pmap_plot

### ** Examples

## No test: 
library(tidyr)
library(purrr)
library(rbokeh)
library(dplyr)

iris %>%
  nest(-Species) %>%
  mutate(
    mod = map(data, ~ lm(Sepal.Length ~ Sepal.Width, data = .x)),
    panel = map2_plot(data, mod, function(data, mod) {
      figure(xlab = "Sepal.Width", ylab = "Sepal.Length") %>%
        ly_points(data$Sepal.Width, data$Sepal.Length) %>%
        ly_abline(mod)
    })) %>%
  trelliscope(name = "iris")

iris %>%
  nest(-Species) %>%
  mutate(
    mod = map(data, ~ lm(Sepal.Length ~ Sepal.Width, data = .x)),
    panel = pmap_plot(list(data = data, mod = mod), function(data, mod) {
      figure(xlab = "Sepal.Width", ylab = "Sepal.Length") %>%
        ly_points(data$Sepal.Width, data$Sepal.Length) %>%
        ly_abline(mod)
    })) %>%
  trelliscope(name = "iris")
## End(No test)



