library(PBSmodelling)


### Name: plotBubbles
### Title: Construct a Bubble Plot from a Matrix
### Aliases: plotBubbles
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  plotBubbles(round(genMatrix(40,20),0),clrs=c("green","grey","red"));
  data(CCA.qbr,envir=.PBSmodEnv)
  plotBubbles(CCA.qbr,cpro=TRUE,powr=.5,dnam=TRUE,size=.15,
    ylim=c(0,70),xlab="Year",ylab="Quillback Rockfish Age")
  par(oldpar)
})



