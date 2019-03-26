library(PBSmodelling)


### Name: addLabel
### Title: Add a Label to a Plot Using Relative (0:1) Coordinates
### Aliases: addLabel
### Keywords: iplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  resetGraph()
  addLabel(0.75,seq(from=0.9,to=0.1,by=-0.10),c('a','b','c'), col="#0033AA")
  par(oldpar)
})



