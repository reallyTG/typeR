library(Directional)


### Name: k-NN algorithm using the arc cosinus distance
### Title: k-NN algorithm using the arc cosinus distance
### Aliases: dirknn
### Keywords: Directional k-NN algorithm Supervised classification

### ** Examples

k <- runif(4, 4, 20)
prob <- c(0.2, 0.4, 0.3, 0.1)
mu <- matrix(rnorm(16), ncol = 4)
mu <- mu / sqrt( rowSums(mu^2) )
da <- rmixvmf(200, prob, mu, k)
nu <- sample(1:200, 180)
x <- da$x[nu, ]
ina <- da$id[nu]
xx <- da$x[-nu, ]
id <- da$id[-nu]
a1 <- dirknn(x, xx, k = 5,  ina, type = "S", mesos = TRUE)
a2 <- dirknn(x, xx, k = 5,ina, type = "NS", mesos = TRUE)
a3 <- dirknn(x, xx, k = 5, ina, type = "S", mesos = FALSE)
a4 <- dirknn(x, xx, k = 5, ina, type = "NS", mesos = FALSE)
b <- vmfda.pred(xx, x, ina)
table(id, a1)
table(id, a2)
table(id, a3)
table(id, a4)



