library(mgc)


### Name: discr.stat
### Title: Discriminability Statistic
### Aliases: discr.stat

### ** Examples


nsrc <- 5
nobs <- 10
d <- 20
set.seed(12345)
src_id <- array(1:nsrc)
labs <- sample(rep(src_id, nobs))
dat <- t(sapply(labs, function(lab) rnorm(d, mean=lab, sd=1)))
discr.stat(dat, labs)




