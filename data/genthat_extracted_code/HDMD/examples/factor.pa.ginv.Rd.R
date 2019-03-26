library(HDMD)


### Name: factor.pa.ginv
### Title: Principal Axis Factor Analysis when D>>N
### Aliases: factor.pa.ginv

### ** Examples

#compare Principal Components and Factor Analysis methods on Amino Acid data with D>>N

data(AA54)
AA54_PCA = princomp(AA54, covmat = cov.wt(AA54))

Factor54 = factor.pa.ginv(AA54, nfactors = 5, m=3, prerotate=TRUE, rotate="Promax", scores="regression")
Factor54$loadings[order(Factor54$loadings[,1]),]  

require(scatterplot3d)
  Factor3d =scatterplot3d(Factor54$scores[,1:3], pch = AminoAcids, main="Factor Scores", box = FALSE, grid=FALSE, xlab="pah", ylab="pss", zlab="ms")
  Factor3d$plane3d(c(0,0,0), col="grey")
  Factor3d$points3d(c(0,0), c(0,0), c(-3,2), lty="solid", type="l" )
  Factor3d$points3d(c(0,0), c(-1.5,2), c(0,0), lty="solid", type="l" )
  Factor3d$points3d(c(-1.5,2), c(0,0), c(0,0), lty="solid", type="l" )
  Factor3d$points3d(Factor54$scores[hydrophobic,1:3], col="blue", cex = 2.7, lwd=1.5)
  Factor3d$points3d(Factor54$scores[polar,1:3], col="green", cex = 3.3, lwd=1.5)
  Factor3d$points3d(Factor54$scores[small,1:3], col="orange", cex = 3.9, lwd=1.5)
  legend(x=5, y=4.5, legend=c("hydrophobic", "polar", "small"), col=c("blue", "green", "orange"), pch=21, box.lty =0)

cor(AA54_PCA$scores, Factor54$scores)



