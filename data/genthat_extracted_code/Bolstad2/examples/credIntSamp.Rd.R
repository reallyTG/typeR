library(Bolstad2)


### Name: credIntSamp
### Title: Calculate a credible interval from a numerically specified
###   posterior CDF
### Aliases: credIntSamp

### ** Examples

## posterior is N(0,1)
theta <- rnorm(1000)
ci<-credIntSamp(theta)
plot(density(theta))
abline(v=c(unlist(ci)))



