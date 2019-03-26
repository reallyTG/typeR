library(trelliscopejs)


### Name: map2_cog
### Title: Map over multiple inputs simultaneously and return a vector of
###   cognostics data frames
### Aliases: map2_cog pmap_cog

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
    cogs = map2_cog(data, mod, function(data, mod) {
      data_frame(max_sl = max(data$Sepal.Length), slope = coef(mod)[2])
    }),
    panel = map2_plot(data, mod, function(data, mod) {
      figure(xlab = "Sepal.Width", ylab = "Sepal.Length") %>%
        ly_points(data$Sepal.Width, data$Sepal.Length) %>%
        ly_abline(mod)
    })) %>%
  trelliscope(name = "iris")
## End(No test)



