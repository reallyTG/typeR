library(fgof)


### Name: gof.test
### Title: One Sample Goodness-of-fit Test
### Aliases: gof.test
### Keywords: htest

### ** Examples

set.seed(123)

n <- 200
x <- rlnorm(200, 1, 1)

system.time(m1 <- gof.test(x, "lnorm", 1000, list(meanlog=1, sdlog=1), simulation="pb"))
system.time(m2 <- gof.test(x, "lnorm", 200, list(meanlog=1, sdlog=1), simulation="mult"))
apply(m1$stat.sim, 1, summary)
apply(m2$stat.sim, 1, summary)

system.time(m1 <- gof.test(x, "gamma", 1000, list(shape=1, rate=1), simulation="pb"))
system.time(m2 <- gof.test(x, "gamma", 200, list(shape=1, rate=1), simulation="mult"))
apply(m1$stat.sim, 1, summary)
apply(m2$stat.sim, 1, summary)


system.time(m1 <- gof.test(x, "exp", 1000, list(rate=1), simulation="pb"))
system.time(m2 <- gof.test(x, "exp", 200, list(rate=1), simulation="mult"))
apply(m1$stat.sim, 1, summary)
apply(m2$stat.sim, 1, summary)




