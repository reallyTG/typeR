library(PBSmodelling)


### Name: addLegend
### Title: Add a Legend to a Plot Using Relative (0:1) Coordinates
### Aliases: addLegend
### Keywords: iplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  resetGraph()
  n <- sample(1:length(colors()),15); clrs <- colors()[n]
  addLegend(.2,1,fill=clrs,leg=clrs,cex=1.5)
  par(oldpar)
})



