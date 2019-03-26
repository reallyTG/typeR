library(BaPreStoPro)


### Name: predict,est.mixedRegression-method
### Title: Prediction for a mixed regression model
### Aliases: predict,est.mixedRegression-method

### ** Examples

mu <- c(10, 5); Omega <- c(0.9, 0.01)
phi <- cbind(rnorm(21, mu[1], sqrt(Omega[1])), rnorm(21, mu[2], sqrt(Omega[2])))
model <- set.to.class("mixedRegression",
         parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
         fun = function(phi, t) phi[1]*t + phi[2], sT.fun = function(t) 1)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)
est <- estimate(model, t, data[1:20,], 2000)
plot(est)
pred <- predict(est, fun.mat = function(phi, t) phi[,1]*t + phi[,2])
points(t, data[21,], pch = 20)

t.list <- list()
for(i in 1:20) t.list[[i]] <- t
t.list[[21]] <- t[1:50]
data.list <- list()
for(i in 1:20) data.list[[i]] <- data[i,]
data.list[[21]] <- data[21, 1:50]
est <- estimate(model, t.list, data.list, 100)
pred <- predict(est, t = t[50:101], which.series = "current", ind.pred = 21,
   fun.mat = function(phi, t) phi[,1]*t + phi[,2])



