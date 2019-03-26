library(truncgof)


### Name: adup.test
### Title: Supremum Class Upper Tail Anderson-Darling test
### Aliases: adup.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
adup.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



