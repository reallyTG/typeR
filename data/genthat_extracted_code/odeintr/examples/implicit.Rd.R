library(odeintr)


### Name: compile_implicit
### Title: Compile Stiff ODE system solver
### Aliases: compile_implicit JacobianCpp

### ** Examples

## Not run: 
##D # Lorenz model from odeint examples
##D pars = c(sigma = 10, R = 28, b = 8 / 3)
##D Lorenz.sys = '
##D   dxdt[0] = sigma * (x[1] - x[0]);
##D   dxdt[1] = R * x[0] - x[1] - x[0] * x[2];
##D   dxdt[2] = -b * x[2] + x[0] * x[1];
##D ' # Lorenz.sys
##D cat(JacobianCpp(Lorenz.sys))
##D compile_implicit("lorenz", Lorenz.sys, pars, TRUE)
##D x = lorenz(rep(1, 3), 100, 0.001)
##D plot(x[, c(2, 4)], type = 'l', col = "steelblue")
##D Sys.sleep(0.5)
##D # Stiff example from odeint docs
##D Stiff.sys = '
##D  dxdt[0] = -101.0 * x[0] - 100.0 * x[1];
##D  dxdt[1] = x[0];
##D ' # Stiff.sys
##D cat(JacobianCpp(Stiff.sys))
##D compile_implicit("stiff", Stiff.sys)
##D x = stiff(c(2, 1), 7, 0.001)
##D plot(x[, 1:2], type = "l", lwd = 2, col = "steelblue")
##D lines(x[, c(1, 3)], lwd = 2, col = "darkred")
##D # Robertson chemical kinetics problem
##D Robertson = '
##D dxdt[0] = -alpha * x[0] + beta * x[1] * x[2];
##D dxdt[1] = alpha * x[0] - beta * x[1] * x[2] - gamma * x[1] * x[1];
##D dxdt[2] = gamma * x[1] * x[1];
##D ' # Robertson
##D pars = c(alpha = 0.04, beta = 1e4, gamma = 3e7)
##D init.cond = c(1, 0, 0)
##D cat(JacobianCpp(Robertson))
##D compile_implicit("robertson", Robertson, pars, TRUE)
##D at = 10 ^ seq(-5, 5, len = 400)
##D x = robertson_at(init.cond, at)
##D par(mfrow = c(3, 1), mar = rep(0.5, 4), oma = rep(5, 4), xpd = NA)
##D plot(x[, 1:2], type = "l", lwd = 3,
##D      col = "steelblue", log = "x", axes = F, xlab = NA)
##D axis(2); box()
##D plot(x[, c(1, 3)], type = "l", lwd = 3,
##D      col = "steelblue", log = "x", axes = F, xlab = NA)
##D axis(4); box()
##D plot(x[, c(1, 4)], type = "l", lwd = 3,
##D      col = "steelblue", log = "x", axes = F)
##D axis(2); axis(1); box()
## End(Not run)



