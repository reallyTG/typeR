library(FastRWeb)


### Name: WebPlot
### Title: Graphics device for inclusion of plots in FastRWeb results.
### Aliases: WebPlot
### Keywords: interface

### ** Examples

## example 1: single image
## if saved as "plot.png.R"
## it can be served as http://server/cgi-bin/R/plot.png
run <- function(n = 100, ...) {
  n <- as.integer(n)
  # create the WebPlto device
  p <- WebPlot(800, 600)
  # plot ...
  plot(rnorm(n), rnorm(n), pch=19, col="#ff000080")
  # return the WebPlot result
  p
}

## example 2: page containing multiple images
## if saved as "plotex.html.R"
## it can be served as http://server/cgi-bin/R/plotex.html
run <- function(...) {
  out("<h2>Simple example<h2>")
  data(iris) ## ideally, you'll use data from the Rserve session
  attach(iris)
  p <- WebPlot(600, 600)
  plot(Sepal.Length, Petal.Length, pch=19, col=Species)
  out(p)
  p <- WebPlot(350, 600)
  barplot(table(Species), col=seq.int(levels(Species)))
  out(p)
  done()
}



