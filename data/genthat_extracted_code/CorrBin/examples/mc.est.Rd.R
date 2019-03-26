library(CorrBin)


### Name: mc.est
### Title: Distribution of the number of responses assuming marginal
###   compatibility.
### Aliases: mc.est mc.est.CBData mc.est.CMData
### Keywords: models nonparametric

### ** Examples

data(shelltox)
sh.mc <- mc.est(shelltox)

library(lattice)
xyplot(Prob~NResp|factor(ClusterSize), groups=Trt, data=sh.mc, subset=ClusterSize>0,
   type="l", as.table=TRUE, auto.key=list(columns=4, lines=TRUE, points=FALSE),
   xlab="Number of responses", ylab="Probability P(R=r|N=n)")
data(dehp)
dehp.mc <- mc.est(subset(dehp, Trt=="0"))
subset(dehp.mc, ClusterSize==2)



