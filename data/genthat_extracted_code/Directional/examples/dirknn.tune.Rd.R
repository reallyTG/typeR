library(Directional)


### Name: Tuning of the k-NN algorithm using the arc cosinus distance
### Title: k-NN algorithm using the arc cosinus distance. Tuning the k
###   neigbours
### Aliases: dirknn.tune
### Keywords: Directional k-NN algorithm Supervised classification

### ** Examples

k <- runif(4, 4, 20)
prob <- c(0.2, 0.4, 0.3, 0.1)
mu <- matrix(rnorm(16), ncol = 4)
mu <- mu / sqrt( rowSums(mu^2) )
da <- rmixvmf(200, prob, mu, k)
x <- da$x
ina <- da$id
dirknn.tune(x, M = 5, A = 10, ina, type = "S", mesos = TRUE)
dirknn.tune(x, M = 10, A = 5, ina, type = "S", mesos = TRUE)



