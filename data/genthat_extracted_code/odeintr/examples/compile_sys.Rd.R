library(odeintr)


### Name: compile_sys
### Title: Compile ODE system
### Aliases: compile_sys

### ** Examples

## Not run: 
##D # Logistic growth
##D compile_sys("logistic", "dxdt = x * (1 - x)")
##D plot(logistic(0.001, 15, 0.1), type = "l", lwd = 2, col = "steelblue")
##D Sys.sleep(0.5)
##D 
##D # Lotka-Volterra predator-prey equations
##D pars = c(alpha = 1, beta = 1, gamma = 1, delta = 1)
##D LV.sys = '
##D   dxdt[0] = alpha * x[0] - beta * x[0] * x[1];
##D   dxdt[1] = gamma * x[0] * x[1] - delta * x[1];
##D ' # LV.sys
##D compile_sys("preypred", LV.sys, pars, TRUE)
##D x = preypred(rep(2, 2), 100, 0.01)
##D plot(x[, 2:3], type = "l", lwd = 2,
##D      xlab = "Prey", ylab = "Predator",
##D      col = "steelblue")
##D Sys.sleep(0.5)
##D 
##D # Lorenz model from odeint examples
##D pars = c(sigma = 10, R = 28, b = 8 / 3)
##D Lorenz.sys = '
##D   dxdt[0] = sigma * (x[1] - x[0]);
##D   dxdt[1] = R * x[0] - x[1] - x[0] * x[2];
##D   dxdt[2] = -b * x[2] + x[0] * x[1];
##D ' # Lorenz.sys
##D compile_sys("lorenz", Lorenz.sys, pars, TRUE)
##D x = lorenz(rep(1, 3), 100, 0.001)
##D plot(x[, c(2, 4)], type = 'l', col = "steelblue")
## End(Not run)



