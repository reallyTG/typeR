library(multipanelfigure)


### Name: capture_base_plot
### Title: Capture a base plot
### Aliases: capture_base_plot capturebaseplot

### ** Examples

p <- capture_base_plot(hist(rnorm(1000), seq(-4, 4, 0.2)))
grid::grid.draw(p)
# If the plot takes multiple lines to draw, then wrap the code in braces.
p2 <- capture_base_plot({
  par(las = 1)
  plot(1:5)
  title("One to five")
})
grid::grid.draw(p2)



