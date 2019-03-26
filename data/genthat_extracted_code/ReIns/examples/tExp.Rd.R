library(ReIns)


### Name: tExp
### Title: The truncated exponential distribution
### Aliases: dtexp ptexp qtexp rtexp
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dtexp(x, rate = 2, endpoint=5), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, ptexp(x, rate = 2, endpoint=5), xlab="x", ylab="CDF", type="l")




