library(ReIns)


### Name: tWeibull
### Title: The truncated Weibull distribution
### Aliases: dtweibull ptweibull qtweibull rtweibull
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dtweibull(x, shape=2, scale=0.5, endpoint=1), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, ptweibull(x, shape=2, scale=0.5, endpoint=1), xlab="x", ylab="CDF", type="l")




