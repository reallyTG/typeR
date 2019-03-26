library(stackoverflow)


### Name: ddensity
### Title: Distribution methods for density objects
### Aliases: ddensity pdensity qdensity rdensity

### ** Examples

x <- rnorm(100, mean=0:5)
d <- density(x)
r <- rdensity(10000, d)
plot(d)
lines(density(r), new=TRUE, col='blue', lty='dashed')



