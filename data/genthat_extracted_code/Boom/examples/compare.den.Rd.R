library(Boom)


### Name: compare.den
### Title: Compare several density estimates.
### Aliases: compare.den CompareDen compare.densities CompareDensities
### Keywords: hplot

### ** Examples


x <- t(matrix(rnorm(5000, 1:5, 1:5), nrow=5))
CompareDensities(x, legend.text=c("EJ", "TK", "JT", "OtherEJ", "TJ"),
                 col=rainbow(5), lwd=2)



