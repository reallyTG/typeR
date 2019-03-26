library(colorfulVennPlot)


### Name: plotVenn
### Title: Plot Venn diagram for 2-, 3-, 4- dimensional data.
### Aliases: plotVenn
### Keywords: hplot

### ** Examples

  y <- c(37,29,6,232,121,77,25)
  names(y) <- c("001","010","011","100","101","110","111")
  labels <- c("A","B","C")
  plot.new()
  plotVenn(y, labels, Colors=rainbow(7))



