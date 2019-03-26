library(PBSmodelling)


### Name: plotTrace
### Title: Plot Trace Lines from a Data Frame, Matrix, or Vector
### Aliases: plotTrace
### Keywords: graphs

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  z <- data.frame(x=1:50,y1=rnorm(50,sd=3),y2=rnorm(50,sd=1),y3=rnorm(50,sd=.25))
  plotTrace(z,lwd=3)
  par(oldpar)
})



