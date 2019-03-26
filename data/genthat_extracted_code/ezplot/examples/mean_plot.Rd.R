library(ezplot)


### Name: mean_plot
### Title: mean_plot
### Aliases: mean_plot

### ** Examples

library(dplyr)
mean_plot(mtcars, c("Number of Cylinders" = "factor(cyl)"), "hp > 110",
          labels = function(x) ez_labels(100 * x, append = "%"))



