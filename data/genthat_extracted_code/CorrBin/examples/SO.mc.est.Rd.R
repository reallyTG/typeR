library(CorrBin)


### Name: SO.mc.est
### Title: Order-restricted MLE assuming marginal compatibility
### Aliases: SO.mc.est
### Keywords: models nonparametric

### ** Examples

data(shelltox)
 ml <- SO.mc.est(shelltox, control=soControl(eps=0.01, method="ISDM"))
 attr(ml, "converge")

 require(lattice)
 panel.cumsum <- function(x,y,...){
   x.ord <- order(x)
   panel.xyplot(x[x.ord], cumsum(y[x.ord]), ...)}

 xyplot(Prob~NResp|factor(ClusterSize), groups=Trt, data=ml, type="s",
      panel=panel.superpose, panel.groups=panel.cumsum,
      as.table=TRUE, auto.key=list(columns=4, lines=TRUE, points=FALSE),
      xlab="Number of responses", ylab="Cumulative Probability R(R>=r|N=n)",
      ylim=c(0,1.1), main="Stochastically ordered estimates\n with marginal compatibility")



