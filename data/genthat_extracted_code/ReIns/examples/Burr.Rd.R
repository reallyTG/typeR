library(ReIns)


### Name: Burr
### Title: The Burr distribution
### Aliases: dburr pburr qburr rburr
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(0, 10, 0.01)
plot(x, dburr(x, alpha=2, rho=-1), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(0, 10, 0.01)
plot(x, pburr(x, alpha=2, rho=-1), xlab="x", ylab="CDF", type="l")




