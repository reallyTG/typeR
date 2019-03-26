library(truncgof)


### Name: w2.test
### Title: Cram/'er-von Mises test
### Aliases: w2.test
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
w2.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)



