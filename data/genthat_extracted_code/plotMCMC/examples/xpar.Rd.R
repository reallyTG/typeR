library(plotMCMC)


### Name: xpar
### Title: MCMC Results for Model Parameters
### Aliases: xpar
### Keywords: datasets

### ** Examples

plotTrace(xpar, xlab="Iterations", ylab="Parameter value",
          layout=c(2,4))
plotTrace(xpar$R0, axes=TRUE, div=1000)

plotAuto(xpar$R0)
plotAuto(xpar$R0, thin=10)
plotAuto(xpar, lag.max=50, ann=FALSE, axes=FALSE)

plotCumu(xpar$R0, main="R0")
plotCumu(xpar$cSfull, main="cSfull")
plotCumu(xpar, probs=c(0.25,0.75), ann=FALSE, axes=FALSE)

plotSplom(xpar, pch=".")

plotDens(xpar, xlab="Parameter value", ylab="Posterior density\n")



