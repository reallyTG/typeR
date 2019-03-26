library(ReIns)


### Name: GPD
### Title: The generalised Pareto distribution
### Aliases: dgpd pgpd qgpd rgpd
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dgpd(x, gamma=1/2, sigma=5), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, pgpd(x, gamma=1/2, sigma=5), xlab="x", ylab="CDF", type="l")



