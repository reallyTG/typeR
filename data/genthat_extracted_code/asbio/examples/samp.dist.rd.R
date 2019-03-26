library(asbio)


### Name: samp.dist
### Title: Animated and/or snapshot representations of a statistic's
###   sampling distribution
### Aliases: samp.dist samp.dist.snap samp.dist.method.tck samp.dist.tck
###   samp.dist.snap.tck1 samp.dist.snap.tck2 dirty.dist samp.dist.n
### Keywords: graphs

### ** Examples

## Not run: 
##D ##Central limit theorem
##D #Snapshots of four sample sizes.
##D samp.dist.snap(parent=expression(rexp(s.size)), s.size = c(1,5,10,50), R = 1000)
##D 
##D ##sample mean animation
##D samp.dist(parent=expression(rexp(s.size)), col.anim="heat.colors", interval=.3)
##D 
##D ##Distribution of t-statistics from a pooled variance t-test under valid and invalid assumptions
##D #valid
##D t.star<-function(s.dist1, s.dist2, s.dist3, s.dist4, s.size = 6, s.size2 = 
##D s.size2){
##D MSE<-(((s.size - 1) * s.dist3) + ((s.size2 - 1) * s.dist4))/(s.size + s.size2-2)
##D func.res <- (s.dist1 - s.dist2)/(sqrt(MSE) * sqrt((1/s.size) + (1/s.size2)))
##D func.res}
##D 
##D samp.dist(parent = expression(rnorm(s.size)), parent2 = 
##D expression(rnorm(s.size2)), s.size=6, s.size2 = 6, R=1000, stat = mean, 
##D stat2 = mean, stat3 = var, stat4 = var, xlab = "t*", func = t.star)
##D 
##D curve(dt(x, 10), from = -6, to = 6, add = TRUE, lwd = 2)
##D legend("topleft", lwd = 2, col = 1, legend = "t(10)")
##D 
##D #invalid; same population means (null true) but different variances and other distributional 
##D #characteristics.
##D samp.dist(parent = expression(runif(s.size, min = 0, max = 2)), parent2 = 
##D expression(rexp(s.size2)), s.size=6, s.size2 = 6, R = 1000, stat = mean, 
##D stat2 = mean, stat3 = var, stat4 = var, xlab = "t*", func = t.star)
##D 
##D curve(dt(x, 10),from = -6, to = 6,add = TRUE, lwd = 2)
##D legend("topleft", lwd = 2, col = 1, legend = "t(10)")
##D 
##D ## Pearson's R
##D require(mvtnorm)
##D BVN <- function(s.size) rmvnorm(s.size, c(0, 0), sigma = matrix(ncol = 2, 
##D nrow = 2, data = c(1, 0, 0, 1)))
##D samp.dist(biv.parent = expression(BVN(s.size)), s.size = 20, func = cor, xlab = "r")
##D                                                   
##D #Interactive GUI, require package 'tcltk'
##D samp.dist.tck("S^2")
##D samp.dist.snap.tck1("Huber estimator")
##D samp.dist.snap.tck2("F*")
## End(Not run)



