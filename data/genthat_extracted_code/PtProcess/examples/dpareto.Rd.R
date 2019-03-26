library(PtProcess)


### Name: dpareto
### Title: Pareto and Tapered Pareto Distributions
### Aliases: dpareto ppareto qpareto rpareto dtappareto ltappareto
###   ptappareto qtappareto rtappareto
### Keywords: distribution

### ** Examples

#    Simulate and plot histogram with density for Pareto Distribution

a0 <- 2
lambda0 <- 2
x <- rpareto(1000, lambda=lambda0, a=a0)
x0 <- seq(a0, max(x)+0.1, length=100)
hist(x, freq=FALSE, breaks=x0, xlim=range(x0),
     main="Pareto Distribution")
points(x0, dpareto(x0, lambda0, a0), type="l", col="red")

#-----------------------------------------------
#    Calculate probabilities and quantiles for Pareto Distribution

a0 <- 2
lambda0 <- 2
prob <- ppareto(seq(a0, 8), lambda0, a0)
quan <- qpareto(prob, lambda0, a0)
print(quan)

#-----------------------------------------------
#    Simulate and plot histogram with density for tapered Pareto Distribution

a0 <- 2
lambda0 <- 2
theta0 <- 3
x <- rtappareto(1000, lambda=lambda0, theta=theta0, a=a0)
x0 <- seq(a0, max(x)+0.1, length=100)
hist(x, freq=FALSE, breaks=x0, xlim=range(x0),
     main="Tapered Pareto Distribution")
points(x0, dtappareto(x0, lambda0, theta0, a0), type="l", col="red")

#-----------------------------------------------
#    Calculate probabilities and quantiles for tapered Pareto Distribution

a0 <- 2
lambda0 <- 2
theta0 <- 3
prob <- ptappareto(seq(a0, 8), lambda0, theta0, a0)
quan <- qtappareto(prob, lambda0, theta0, a0)
print(quan)

#-----------------------------------------------
#    Calculate log-likelihood for tapered Pareto Distribution
#    note the Hessian and gradient attributes

a0 <- 2
lambda0 <- 2
theta0 <- 3
x <- rtappareto(1000, lambda=lambda0, theta=theta0, a=a0)
LL <- ltappareto(x, lambda=lambda0, theta=theta0, a=a0)
print(LL)




