library(mize)


### Name: mize
### Title: Numerical Optimization
### Aliases: mize

### ** Examples

# Function to optimize and starting point defined after creating optimizer
rosenbrock_fg <- list(
  fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
  gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                         200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

# Minimize using L-BFGS
res <- mize(rb0, rosenbrock_fg, method = "L-BFGS")

# Conjugate gradient with Fletcher-Reeves update, tight Wolfe line search
res <- mize(rb0, rosenbrock_fg, method = "CG", cg_update = "FR", c2 = 0.1)

# Steepest decent with constant momentum = 0.9
res <- mize(rb0, rosenbrock_fg, method = "MOM", mom_schedule = 0.9)

# Steepest descent with constant momentum in the Nesterov style as described
# in papers by Sutskever and Bengio
res <- mize(rb0, rosenbrock_fg, method = "MOM", mom_type = "nesterov",
             mom_schedule = 0.9)

# Nesterov momentum with adaptive restart comparing function values
res <- mize(rb0, rosenbrock_fg, method = "MOM", mom_type = "nesterov",
             mom_schedule = 0.9, restart = "fn")



