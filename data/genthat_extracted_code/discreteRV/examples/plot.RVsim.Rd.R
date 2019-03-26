library(discreteRV)


### Name: plot.RVsim
### Title: Plot a simulated random vector
### Aliases: plot.RVsim

### ** Examples

X <- RV(c(100000,10000,0), c(0.00025,0.005,0.99475))
X.sim <- rsim(X, 200000)

plot(X.sim)



