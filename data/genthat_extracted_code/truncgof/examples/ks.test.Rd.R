library(truncgof)


### Name: ks.test
### Title: Kolmogorov-Smirnov test
### Aliases: ks.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
ks.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



