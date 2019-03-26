library(rvalues)


### Name: PostSummaries
### Title: R-values from posterior summary quantities
### Aliases: PostSummaries
### Keywords: htest models

### ** Examples

n <- 500
theta <- rnorm(n)
sig_sq <- rgamma(n,shape=1,scale=1)
X <- theta + sqrt(sig_sq)*rnorm(n)

pm <- X/(sig_sq + 1)
psd <- sqrt(sig_sq/(sig_sq + 1))

rvs <- PostSummaries(post.means=pm,post.sds=psd,hypers=list(mean=0,sd=1))
hist(rvs$rvalues)



