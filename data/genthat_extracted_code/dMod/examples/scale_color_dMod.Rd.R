library(dMod)


### Name: scale_color_dMod
### Title: Standard dMod color palette
### Aliases: scale_color_dMod

### ** Examples

library(ggplot2)
times <- seq(0, 2*pi, 0.1)
values <- sin(times)
data <- data.frame(
   time = times, 
   value = c(values, 1.2*values, 1.4*values, 1.6*values), 
   group = rep(c("C1", "C2", "C3", "C4"), each = length(times))
)
qplot(time, value, data = data, color = group, geom = "line") + 
   theme_dMod() + scale_color_dMod()



