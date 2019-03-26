library(colorfulVennPlot)


### Name: plotVenn2d
### Title: Plot Venn diagram for 2-dimensional data.
### Aliases: plotVenn2d
### Keywords: hplot

### ** Examples

  # plot generic X, Y and intersection
  plot.new()
  plotVenn2d(rep("",3), radius=c(1.25,1.25), labels=c("Y","X"), Colors=c("yellow","orange","pink"))
  grid.text(expression(paste(X,intersect(Y))),0.5,0.5)
  grid.text("X",0.25,0.5)
  grid.text("Y",0.75,0.5)
  
  # rotated plot
  y <- c(37,29,6)
  labels <- c("A","B")
  plot.new()
  plotVenn2d(y, labels, Colors=rainbow(3), Title = "This is an example of a 2D Venn plot",
    radius=c(0.85, 1.0), rot=45)



