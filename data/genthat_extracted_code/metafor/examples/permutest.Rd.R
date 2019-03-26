library(metafor)


### Name: permutest
### Title: Permutation Tests for 'rma.uni' Objects
### Aliases: permutest permutest.rma.uni
### Keywords: models

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model
res <- rma(yi, vi, data=dat)
res

### permutation test (approximate and exact)
## Not run: 
##D permutest(res)
##D permutest(res, exact=TRUE)
## End(Not run)

### mixed-effects model with two moderators (absolute latitude and publication year)
res <- rma(yi, vi, mods = ~ ablat + year, data=dat)
res

### permutation test (approximate only; exact not feasible)
## Not run: 
##D 
##D permres <- permutest(res, iter=10000, retpermdist=TRUE)
##D permres
##D 
##D ### histogram of permutation distribution for absolute latitude
##D ### dashed horizontal line: the observed value of the test statistic
##D ### red curve: standard normal density
##D ### blue curve: kernel density estimate of the permutation distribution
##D ### note that the tail area under the permutation distribution is larger
##D ### than under a standard normal density (hence, the larger p-value)
##D hist(permres$zval.perm[,2], breaks=120, freq=FALSE, xlim=c(-5,5), ylim=c(0,.4),
##D      main="Permutation Distribution", xlab="Value of Test Statistic", col="gray90")
##D abline(v=res$zval[2], lwd=2, lty="dashed")
##D abline(v=0, lwd=2)
##D curve(dnorm, from=-5, to=5, add=TRUE, lwd=2, col=rgb(1,0,0,alpha=.7))
##D lines(density(permres$zval.perm[,2]), lwd=2, col=rgb(0,0,1,alpha=.7))
## End(Not run)



