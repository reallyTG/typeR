library(RobAStBase)


### Name: internals_for_RobAStBase_ddPlot
### Title: Internal / Helper functions of package RobAStBase for ddPlot
### Aliases: internals_for_RobAStBase_ddPlot .ddPlot.MatNtNtCoCo
### Keywords: internal hplot

### ** Examples

MX <- matrix(rnorm(1500),nrow=6)
QM <- matrix(rnorm(36),nrow=6); QM <- QM %*% t(QM)
RobAStBase:::.ddPlot.MatNtNtCoCo(data=MX, 
        dist.y=QFNorm(QuadF=PosSemDefSymmMatrix(QM)),
        xlab="Norm.x",ylab="Norm.y", cex.idn = 1.3, offset=0,
        lwd=2, lwd.cutoff=4, lty=2, col.cutoff =2, col.idn="green",
        col = "blue", adj=0.4, pos=4,id.n = sample(1:200,size=100),
        lab.pts=letters,log="x", main="GA", sub="NO",cex.sub=0.2)



