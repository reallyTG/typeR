library(ReIns)


### Name: Fréchet
### Title: The Frechet distribution
### Aliases: dfrechet pfrechet qfrechet rfrechet
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(1,10,0.01)
plot(x, dfrechet(x, shape=2), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(1,10,0.01)
plot(x, pfrechet(x, shape=2), xlab="x", ylab="CDF", type="l")




