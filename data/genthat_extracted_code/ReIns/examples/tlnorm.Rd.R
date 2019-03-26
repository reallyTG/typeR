library(ReIns)


### Name: tlnorm
### Title: The truncated log-normal distribution
### Aliases: dtlnorm ptlnorm qtlnorm rtlnorm
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dtlnorm(x, endpoint=9), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, ptlnorm(x, endpoint=9), xlab="x", ylab="CDF", type="l")




