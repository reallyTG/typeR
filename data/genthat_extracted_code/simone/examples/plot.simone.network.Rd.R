library(simone)


### Name: plot.simone.network
### Title: Graphical representation of a network
### Aliases: plot.simone.network
### Keywords: hplot graphs

### ** Examples

## data set and graph generation
lambda  <- 0.125
epsilon <- 0.00125
alpha <- c(1/3,1/3,1/3)

pi.affi <- matrix(epsilon,3,3)
diag(pi.affi) <- lambda

g1 <- rNetwork(p=200, pi=pi.affi, alpha=alpha)
g2 <- coNetwork(g1, delta=10)

plot(g1, type="cluster") # the default
plot(g1, type="circle" ) # one circle
plot(g1, type="circles" ) # one circle per cluster
plot(g1, g2, type="4graphs") # the default for multiple inputs
plot(g1, g2, type="overlap") # comparison of 2 networks on an unique graph



