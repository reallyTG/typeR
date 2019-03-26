library(normalp)


### Name: rnormp
### Title: Pseudo-random numbers from an exponential power distribution
### Aliases: rnormp
### Keywords: distribution

### ** Examples

## Generate a random sample x from an exponential power distribution
## At the end we have the histogram of x
x <- rnormp(1000, 1, 2, 1.5)
hist(x, main="Histogram of the random sample")



