library(splancs)


### Name: stmctest
### Title: Monte-Carlo test of space-time clustering
### Aliases: stmctest
### Keywords: spatial

### ** Examples

example(stkhat)
bur1mc <- stmctest(burpts, burkitt$t, burbdy, c(400, 5800),
  seq(1,40,2), seq(100, 1500, 100), nsim=49, quiet=TRUE, returnSims=TRUE)
plot(density(bur1mc$t), xlim=range(c(bur1mc$t0, bur1mc$t)))
abline(v=bur1mc$t0)
r0 <- attr(bur1mc, "obs")$kst-outer(attr(bur1mc, "obs")$ks, attr(bur1mc, "obs")$kt)
rsimlist <- lapply(attr(bur1mc, "sims"), function(x) x$kst - outer(x$ks, x$kt))
rarray <- array(do.call("cbind", rsimlist), dim=c(20, 15, 49))
rmin <- apply(rarray, c(1,2), min)
rmax <- apply(rarray, c(1,2), max)
r0 < rmin
r0 > rmax



