library(polylabelr)


### Name: poi
### Title: Pole of Inaccessibility (Visual Center) of a Polygon
### Aliases: poi

### ** Examples

plot_path <- function(x, y, ...) {
  plot.new()
  plot.window(range(x, na.rm = TRUE), range(y, na.rm = TRUE))
  polypath(x, y, ...)
}

x <- c(5, 10, 10, 5, 5, 6, 6, 7, 7, 6, 8, 8, 9, 9, 8)
y <- c(5, 5, 10, 10, 5, 6, 7, 7, 6, 6, 8, 9, 9, 8, 8)

plot_path(x, y, col = "grey", border = NA)

points(poi(x, y))




