library(ICAOD)


### Name: sensbayes
### Title: Verifying Optimality of Bayesian D-optimal Designs
### Aliases: sensbayes

### ** Examples

##################################################################
# Checking the Bayesian D-optimality of a design for the 2Pl model
##################################################################
skew2 <- skewnormal(xi = c(0, 1), Omega = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                    alpha = c(-1, 0), lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   sensbayes(formula = ~1/(1 + exp(-b *(x - a))),
##D             predvars = "x", parvars = c("a", "b"),
##D             family = binomial(),
##D             x= c(-2.50914, -1.16780, -0.36904, 1.29227),
##D             w =c(0.35767, 0.11032, 0.15621, 0.37580),
##D             lx = -3, ux = 3,
##D             prior = skew2)
##D   # took 29 seconds on my system!
## End(Not run)

# It took very long.
# We re-adjust the tuning parameters in sens.bayes.control to be faster
# See how we drastically reduce the maxEval and increase the tolerance
## Not run: 
##D   sensbayes(formula = ~1/(1 + exp(-b *(x - a))),
##D             predvars = "x", parvars = c("a", "b"),
##D             family = binomial(),
##D             x= c(-2.50914, -1.16780, -0.36904, 1.29227),
##D             w =c(0.35767, 0.11032, 0.15621, 0.37580),
##D             lx = -3, ux = 3,prior = skew2,
##D             sens.bayes.control = list(cubature = list(tol = 1e-4, maxEval = 300)))
##D   # took 5 Seconds on my system!
## End(Not run)



# Compare it with the following:
sensbayes(formula = ~1/(1 + exp(-b *(x - a))),
          predvars = "x", parvars = c("a", "b"),
          family = binomial(),
          x= c(-2.50914, -1.16780, -0.36904, 1.29227),
          w =c(0.35767, 0.11032, 0.15621, 0.37580),
          lx = -3, ux = 3,prior = skew2,
          sens.bayes.control = list(cubature = list(tol = 1e-4, maxEval = 200)))
# Look at the plot!
# took 3 seconds on my system


########################################################################################
# Checking the Bayesian D-optimality of a design for the 4-parameter sigmoid emax model
########################################################################################
lb <- c(4, 11, 100, 5)
ub <- c(9, 17, 140, 10)
## Not run: 
##D   sensbayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D             predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D             x = c(0.78990, 95.66297, 118.42964,147.55809, 500),
##D             w = c(0.23426, 0.17071, 0.17684, 0.1827, 0.23549),
##D             lx = .001, ux = 500,  prior = uniform(lb, ub))
##D   # took 200 seconds on my system
## End(Not run)

# Re-adjust the tuning parameters to have it faster
## Not run: 
##D   sensbayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D             predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D             x = c(0.78990, 95.66297, 118.42964,147.55809, 500),
##D             w = c(0.23426, 0.17071, 0.17684, 0.1827, 0.23549),
##D             lx = .001, ux = 500,  prior = uniform(lb, ub),
##D             sens.bayes.control = list(cubature = list(tol = 1e-3, maxEval = 300)))
##D   # took 4 seconds on my system. See how much it makes difference
## End(Not run)

## Not run: 
##D   # Now we try it with quadrature. Default is 6 nodes
##D   sensbayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D             predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D             x = c(0.78990, 95.66297, 118.42964,147.55809, 500),
##D             w = c(0.23426, 0.17071, 0.17684, 0.1827, 0.23549),
##D             sens_method = "quadrature",
##D             lx = .001, ux = 500,  prior = uniform(lb, ub))
##D   # 166.519 s
##D 
##D   # use less number of nodes  to see if we can reduce the CPU time
##D   sensbayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D             predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D             x = c(0.78990, 95.66297, 118.42964,147.55809, 500),
##D             w = c(0.23426, 0.17071, 0.17684, 0.1827, 0.23549),
##D             sens_method = "quadrature",
##D             sens.bayes.control = list(quadrature = list(level = 3)),
##D             lx = .001, ux = 500,  prior = uniform(lb, ub))
##D   # we don't have an accurate plot
##D 
##D   # use less number of levels: use 4 nodes
##D   sensbayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D             predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D             x = c(0.78990, 95.66297, 118.42964,147.55809, 500),
##D             w = c(0.23426, 0.17071, 0.17684, 0.1827, 0.23549),
##D             sens_method = "quadrature",
##D             sens.bayes.control = list(quadrature = list(level = 4)),
##D             lx = .001, ux = 500,  prior = uniform(lb, ub))
##D 
## End(Not run)



