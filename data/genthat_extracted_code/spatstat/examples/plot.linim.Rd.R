library(spatstat)


### Name: plot.linim
### Title: Plot Pixel Image on Linear Network
### Aliases: plot.linim
### Keywords: spatial

### ** Examples

  X <- linfun(function(x,y,seg,tp){y^2+x}, simplenet)
  X <- as.linim(X)
  
  plot(X)
  plot(X, style="width", main="Width proportional to function value")

  # signed values
  f <- linfun(function(x,y,seg,tp){y-x}, simplenet)
  plot(f, style="w", main="Negative values in red")

  plot(f, style="w", negative.args=list(density=10),
       main="Negative values are hatched")



