library(CircularDDM)


### Name: rvm
### Title: Generate random deviates for the von Mises distribution
### Aliases: rvm

### ** Examples

n  <- 100
mu <- 0
k  <- 10
vm3_de <- rvm(n, mu, k)       ## in degree unit
vm3_pi <- vm3_de %% (2 * pi)  ## in radian unit



