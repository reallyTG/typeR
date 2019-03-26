library(truncgof)


### Name: ad2up.test
### Title: Quadratic Class Upper Tail Anderson-Darling test
### Aliases: ad2up.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
ad2up.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



