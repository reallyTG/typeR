library(PBSmapping)


### Name: convCP
### Title: Convert Contour Lines into a PolySet
### Aliases: convCP
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create sample data for the contourLines() function
  x <- seq(-0.5, 0.8, length=50);  y <- x
  z <- outer(x, y, FUN = function(x,y) { sin(2*pi*(x^2+y^2))^2; } )
  data <- contourLines(x, y, z, levels=c(0.2, 0.8))
  #--- pass that sample data into convCP()
  result <- convCP(data)
  #--- plot the result
  plotLines(result$PolySet, projection=1)
  print(result$PolyData)
  par(oldpar)
})



