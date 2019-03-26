library(ReIns)


### Name: tFréchet
### Title: The truncated Frechet distribution
### Aliases: dtfrechet ptfrechet qtfrechet rtfrechet
### Keywords: distribution

### ** Examples

# Plot of the PDF
x <- seq(1, 10, 0.01)
plot(x, dtfrechet(x, shape=2, endpoint=5), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x <- seq(1, 10, 0.01)
plot(x, ptfrechet(x, shape=2, endpoint=5), xlab="x", ylab="CDF", type="l")




