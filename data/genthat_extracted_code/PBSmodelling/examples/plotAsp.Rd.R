library(PBSmodelling)


### Name: plotAsp
### Title: Construct a Plot with a Specified Aspect Ratio
### Aliases: plotAsp
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  x <- seq(0,10,0.1)
  y <- sin(x)
  par(mfrow=2:1)
  plotAsp(x,y,asp=1,xlim=c(0,10),ylim=c(-2,2), main="sin(x)")
  plotAsp(x,y^2,asp=1,xlim=c(0,10),ylim=c(-2,2), main="sin^2(x)")
  par(oldpar)
})



