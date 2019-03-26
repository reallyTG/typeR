library(odeintr)


### Name: integrate_sys
### Title: Integrate an ODE system using ODEINT
### Aliases: integrate_sys

### ** Examples

## Not run: 
##D # Lotka-Volterra predator-prey equations
##D LV.sys = function(x, t)
##D {
##D    c(x[1] - 0.1 * x[1] * x[2],
##D      0.05 * x[1] * x[2] - 0.5 * x[2])
##D }
##D null_rec = function(x, t) NULL
##D system.time(integrate_sys(LV.sys, rep(1, 2), 1e3, observer = null_rec))
##D named_rec = function(x, t) c(Prey = x[1], Predator = x[2])
##D x = integrate_sys(LV.sys, rep(1, 2), 100, 0.01, observer = named_rec)
##D plot(x[, 2:3], type = "l", lwd = 3, col = "steelblue")
##D Sys.sleep(0.5)
##D 
##D # Lorenz model from odeint examples
##D Lorenz.sys = function(x, t)
##D {
##D  c(10 * (x[2] - x[1]),
##D    28 * x[1] - x[2] - x[1] * x[3],
##D    -8/3 * x[3] + x[1] * x[2])
##D }
##D system.time(integrate_sys(Lorenz.sys, rep(1, 3), 1e2, obs = null_rec))
##D x = integrate_sys(Lorenz.sys, rep(1, 3), 100, 0.01)
##D plot(x[, c(2, 4)], type = 'l', col = "steelblue")
## End(Not run)



