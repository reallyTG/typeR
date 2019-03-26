library(ICAOD)


### Name: sensbayescomp
### Title: Verifying Optimality of Bayesian Compound DP-optimal Designs
### Aliases: sensbayescomp

### ** Examples

##########################################
# Verifing the DP-optimality of a design
# The logistic model with two predictors
##########################################

# The design points and corresponding weights are as follows:
# Point1     Point2     Point3     Point4     Point5     Point6     Point7
# 0.07410  -0.31953   -1.00000     1.00000  -1.00000     1.00000    0.30193
# -1.00000  1.00000   -1.00000     1.00000   -0.08251   -1.00000    1.00000
# Weight1   Weight2    Weight3    Weight4    Weight5    Weight6    Weight7
# 0.020      0.275      0.224      0.131      0.092      0.156      0.103

# It should be given to the function as two seperate vectors:
x1 <- c(0.07409639, -0.3195265, -1, 1, -1, 1, 0.3019317, -1, 1, -1, 1, -0.08251169, -1, 1)
w1 <- c(0.01992863, 0.2745394, 0.2236575, 0.1312331, 0.09161503, 0.1561454, 0.1028811)


p <- c(1, -2, 1, -1)

## Not run: 
##D sensbayescomp(formula = ~exp(b0+b1*x1+b2*x2+b3*x1*x2)/(1+exp(b0+b1*x1+b2*x2+b3*x1*x2)),
##D               predvars = c("x1", "x2"),
##D               parvars = c("b0", "b1", "b2", "b3"),
##D               family = binomial(),
##D               x = x1, w = w1,
##D               lx = c(-1, -1), ux = c(1, 1),
##D               prior = uniform(p -1.5, p + 1.5),
##D               prob = ~1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2)),
##D               alpha = .5, plot_3d = "rgl",
##D               sens.bayes.control = list(cubature = list(tol = 1e-3, maxEval = 1000)))
## End(Not run)








