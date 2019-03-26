library(ICAOD)


### Name: robust
### Title: Robust D-Optimal Designs
### Aliases: robust

### ** Examples

# Finding a robust design for the two-parameter logistic model
# See how we set a stopping rule.
# The ELB is computed every checkfreq = 30 iterations
# The optimization stops when the ELB is larger than stoptol = .95
res1 <- robust(formula = ~1/(1 + exp(-b *(x - a))),
              predvars = c("x"), parvars = c("a", "b"),
              family = binomial(),
              lx = -5, ux = 5, prob = rep(1/4, 4),
              parset = matrix(c(0.5, 1.5, 0.5, 1.5, 4.0, 4.0, 5.0, 5.0), 4, 2),
              iter = 1, k =3,
              ICA.control = list(stop_rule = "equivalence",
                                 stoptol = .95, checkfreq = 30))

## Not run: 
##D res1 <- iterate(res1, 100)
##D # stops at iteration 51
## End(Not run)


## Not run: 
##D res1.1 <- robust(formula = ~1/(1 + exp(-b *(x - a))),
##D               predvars = c("x"), parvars = c("a", "b"),
##D               family = binomial(),
##D               lx = -5, ux = 5, prob = rep(1/4, 4),
##D               parset = matrix(c(0.5, 1.5, 0.5, 1.5, 4.0, 4.0, 5.0, 5.0), 4, 2),
##D               x = c(-3, 0, 3),
##D               iter = 150, k =3)
##D plot(res1.1)
##D # not optimal
## End(Not run)



