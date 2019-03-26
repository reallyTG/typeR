library(compositions)


### Name: qqnorm
### Title: Normal quantile plots for compositions and amounts
### Aliases: qqnorm.acomp qqnorm.rcomp qqnorm.rplus qqnorm.aplus vp.qqnorm
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
qqnorm(acomp(sa.lognormals),alpha=0.05)
qqnorm(rcomp(sa.lognormals),alpha=0.05)
qqnorm(aplus(sa.lognormals),alpha=0.05)
qqnorm(rplus(sa.lognormals),alpha=0.05)



