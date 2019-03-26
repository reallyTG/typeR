library(DiPhiSeq)


### Name: robtest
### Title: Calls the robnb function to estimate the coefficients, and then
###   construct the statistical tests for DD and DE. It works for a single
###   gene. y1 and y2 are count vectors for a single gene. diphiseq calls
###   this function to do the calculation for each gene. Normal users often
###   don't need to use this function directly.
### Aliases: robtest

### ** Examples

d1 <- runif(10, min=1, max=2)
d2 <- runif(15, min=1, max=2)
y1 <- rnbinom(10, size=1, mu=d1*50)
y2 <- rnbinom(15, size=1, mu=d2*50)
res <- robtest(y1, log(d1), y2, log(d2))



