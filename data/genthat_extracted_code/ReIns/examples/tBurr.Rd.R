library(ReIns)


### Name: tBurr
### Title: The truncated Burr distribution
### Aliases: dtburr ptburr qtburr rtburr
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dtburr(x, alpha=2, rho=-1, endpoint=9), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, ptburr(x, alpha=2, rho=-1, endpoint=9), xlab="x", ylab="CDF", type="l")




