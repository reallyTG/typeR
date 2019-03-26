library(RobAStBase)


### Name: ddPlot-methods
### Title: Methods for Function ddPlot in Package 'RobAStBase'
### Aliases: ddPlot ddPlot-methods ddPlot,matrix-method
###   ddPlot,numeric-method ddPlot,data.frame-method
### Keywords: methods hplot

### ** Examples

MX <- matrix(rnorm(1500),nrow=6)
QM <- matrix(rnorm(36),nrow=6); QM <- QM %*% t(QM)
ddPlot(data=MX, dist.y=QFNorm(QuadF=PosSemDefSymmMatrix(QM)))



