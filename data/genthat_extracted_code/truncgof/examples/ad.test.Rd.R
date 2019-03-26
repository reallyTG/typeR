library(truncgof)


### Name: ad.test
### Title: Supremum Class Anderson-Darling test
### Aliases: ad.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)    # complete sample
xt <- xc[xc >= treshold]    # left truncated sample
ad.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



