library(NNS)


### Name: NNS.cor.hd
### Title: NNS Co-Partial Moments Higher Dimension Correlation
### Aliases: NNS.cor.hd
### Keywords: correlation dependence,

### ** Examples

set.seed(123)
x <- rnorm(1000) ; y <- rnorm(1000) ; z <- rnorm(1000)
A <- data.frame(x, y, z)
NNS.cor.hd(A, plot = TRUE, independence.overlay = TRUE)



