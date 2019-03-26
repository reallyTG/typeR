library(manipulateWidget)


### Name: staticPlot
### Title: Include a static image in a combinedWidgets
### Aliases: staticPlot staticImage

### ** Examples

staticPlot(hist(rnorm(100)))

if (require(plotly)) {
  data(iris)

  combineWidgets(
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    staticPlot(hist(iris$Sepal.Length, breaks = 20), height = 300)
  )

  # You can also embed static images in the header, footer, left or right
  # columns of a combinedWidgets. The advantage is that the space allocated
  # to the static plot will be constant when the window is resized.

  combineWidgets(
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    footer = staticPlot(hist(iris$Sepal.Length, breaks = 20), height = 300)
  )
}




