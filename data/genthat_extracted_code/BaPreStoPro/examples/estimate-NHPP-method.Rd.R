library(BaPreStoPro)


### Name: estimate,NHPP-method
### Title: Estimation for a non-homogeneous Poisson process
### Aliases: estimate,NHPP-method

### ** Examples

model <- set.to.class("NHPP", parameter = list(xi = c(5, 1/2)),
                   Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data$Times, 10000, proposal = "lognormal")
plot(est)

##
model <- set.to.class("NHPP", parameter = list(xi = 5),
                   Lambda = function(t, xi) t*xi)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data$N, 10000)
plot(est, par.options = list(mfrow = c(1,1)))



