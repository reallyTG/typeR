library(ReIns)


### Name: Extended Pareto
### Title: The Extended Pareto Distribution
### Aliases: depd pepd qepd repd
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, depd(x, gamma=1/2, kappa=1, tau=-1), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, pepd(x, gamma=1/2, kappa=1, tau=-1), xlab="x", ylab="CDF", type="l")



