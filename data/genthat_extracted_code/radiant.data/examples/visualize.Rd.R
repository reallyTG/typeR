library(radiant.data)


### Name: visualize
### Title: Visualize data using ggplot2 <URL: http://ggplot2.tidyverse.org>
### Aliases: visualize

### ** Examples

visualize(diamonds, "price:cut", type = "dist", fillcol = "red")
visualize(diamonds, "carat:cut", yvar = "price", type = "scatter",
  pointcol = "blue", fun = c("mean", "median"), linecol = c("red","green"))
visualize(diamonds, yvar = "price", xvar = c("cut","clarity"),
  type = "bar", fun = "median")
visualize(diamonds, yvar = "price", xvar = c("cut","clarity"),
  type = "line", fun = "max")
visualize(diamonds, yvar = "price", xvar = "carat", type = "scatter",
          size = "table", custom = TRUE) + scale_size(range = c(1, 10), guide = "none")
visualize(diamonds, yvar = "price", xvar = "carat", type = "scatter", custom = TRUE) +
  labs(title = "A scatterplot", x = "price in $")
visualize(diamonds, xvar = "price:carat", custom = TRUE) %>%
  gridExtra::grid.arrange(grobs = ., top = "Histograms", ncol = 2)
visualize(diamonds, xvar = "cut", yvar = "price", type = "bar",
  facet_row = "cut", fill = "cut")




