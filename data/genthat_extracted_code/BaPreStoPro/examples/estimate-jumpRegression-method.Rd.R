library(BaPreStoPro)


### Name: estimate,jumpRegression-method
### Title: Estimation for regression model dependent on Poisson process
### Aliases: estimate,jumpRegression-method

### ** Examples

t <- seq(0,1, by = 0.01)
model <- set.to.class("jumpRegression", fun = function(t, N, theta) exp(theta[1]*t) + theta[2]*N,
                   parameter = list(theta = c(2, 2), gamma2 = 0.25, xi = c(3, 0.5)),
                   Lambda = function(t, xi) (t/xi[2])^xi[1])
data <- simulate(model, t = t, plot.series = FALSE)
est <- estimate(model, t, data, 1000)
plot(est)
## Not run: 
##D # work in progress
##D est_hid <- estimate(model, t, data$Y, 1000)
##D plot(est_hid)
## End(Not run)



