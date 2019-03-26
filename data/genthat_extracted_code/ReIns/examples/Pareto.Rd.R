library(ReIns)


### Name: Pareto
### Title: The Pareto distribution
### Aliases: dpareto ppareto qpareto rpareto
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(1, 10, 0.01)
plot(x, dpareto(x, shape=2), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(1, 10, 0.01)
plot(x, ppareto(x, shape=2), xlab="x", ylab="CDF", type="l")




