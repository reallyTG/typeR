library(ReIns)


### Name: tGPD
### Title: The truncated generalised Pareto distribution
### Aliases: dtgpd ptgpd qtgpd rtgpd
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dtgpd(x, gamma=1/2, sigma=5, endpoint=8), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, ptgpd(x, gamma=1/2, sigma=5, endpoint=8), xlab="x", ylab="CDF", type="l")




