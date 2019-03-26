library(colorfulVennPlot)


### Name: plotVenn3d
### Title: Plot Venn diagram for 3-dimensional data.
### Aliases: plotVenn3d
### Keywords: hplot

### ** Examples

  y <- c(37,29,6,232,121,77,25)
  names(y) <- c("001","010","011","100","101","110","111")
  labels <- c("A","B","C")
  plot.new()
  plotVenn3d(y, labels, Colors=rainbow(7), Title = "This is an example of a 3D Venn plot")



