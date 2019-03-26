library(ACSWR)


### Name: pareto_density
### Title: Pareto density
### Aliases: pareto_density
### Keywords: Pareto Density

### ** Examples

m <- 9184
n <- 103
b <- 10000
K <- 10
theta <- seq(1000,20000,500)
plot(theta,as.numeric(sapply(theta,pareto_density,scale=b,shape=K)),"l",
     xlab=expression(theta),ylab="The Posterior Density")
(n+1)*m/n



