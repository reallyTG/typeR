library(PBSmodelling)


### Name: plotDens
### Title: Plot Density Curves from a Data Frame, Matrix, or Vector
### Aliases: plotDens
### Keywords: graphs

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  z <- data.frame(y1=rnorm(50,sd=2),y2=rnorm(50,sd=1),y3=rnorm(50,sd=.5))
  plotDens(z,lwd=3)
  par(oldpar)
})



