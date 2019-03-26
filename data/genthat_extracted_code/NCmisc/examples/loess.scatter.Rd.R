library(NCmisc)


### Name: loess.scatter
### Title: Draw a scatterplot with a fit line
### Aliases: loess.scatter

### ** Examples

library(NCmisc)
require(KernSmooth)
DD <- sim.cor(1000,4) # create a simulated, correlated dataset
loess.scatter(DD[,3],DD[,4],loess=FALSE,bty="n",pch=".",cex=2)
loess.scatter(DD[,3],DD[,4],scatter=smoothScatter)
xy <- loess.scatter(DD[,3],DD[,4],return.vectors=TRUE)
prv(xy) # preview the vectors produced



