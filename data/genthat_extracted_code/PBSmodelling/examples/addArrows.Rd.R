library(PBSmodelling)


### Name: addArrows
### Title: Add Arrows to a Plot Using Relative (0:1) Coordinates
### Aliases: addArrows
### Keywords: iplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  tt=seq(from=-5,to=5,by=0.01)
  plot(sin(tt), cos(tt)*(1-sin(tt)), type="l")
  addArrows(0.2,0.5,0.8,0.5)
  addArrows(0.8,0.95,0.95,0.55, col="#FF0066")
  par(oldpar)
})



