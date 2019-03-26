library(truncgof)


### Name: ad2.test
### Title: Quadratic Class Anderson-Darling test
### Aliases: ad2.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(1000, 2, 2)     # complete sample
xt <- xc[xc >= treshold]      # left truncated sample
ad2.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



