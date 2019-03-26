library(ggstatsplot)


### Name: line_labeller
### Title: Adds a label to the horizontal or vertical line.
### Aliases: line_labeller
### Keywords: internal

### ** Examples

# creating a basic plot
set.seed(123)
library(ggplot2)
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

# adding a label
ggstatsplot:::line_labeller(
  plot = p,
  x = median(mtcars$wt),
  y = mean(mtcars$mpg),
  k = 2,
  color = "red",
  label.text = "median"
)



