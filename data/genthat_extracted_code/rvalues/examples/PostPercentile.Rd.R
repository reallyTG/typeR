library(rvalues)


### Name: PostPercentile
### Title: Posterior expected percentiles
### Aliases: PostPercentile
### Keywords: hstat models

### ** Examples

n <- 3000
theta <- rnorm(n, sd = 3)
ses <- sqrt(rgamma(n, shape = 1, scale = 1))
XX <- theta + ses*rnorm(n)
dd <- cbind(XX,ses)

rv <- rvalues(dd, family = gaussian)

perc <- PostPercentile(rv)
plot(rv$rvalues, perc)



