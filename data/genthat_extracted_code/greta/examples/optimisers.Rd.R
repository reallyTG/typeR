library(greta)


### Name: optimisers
### Title: optimisation methods
### Aliases: optimisers nelder_mead powell cg bfgs newton_cg l_bfgs_b tnc
###   cobyla slsqp gradient_descent adadelta adagrad adagrad_da momentum
###   adam ftrl proximal_gradient_descent proximal_adagrad rms_prop

### ** Examples

## Not run: 
##D # use optimisation to find the mean and sd of some data
##D x <- rnorm(100, -2, 1.2)
##D mu <- variable()
##D sd <- variable(lower = 0)
##D distribution(x) <- normal(mu, sd)
##D m <- model(mu, sd)
##D 
##D # configure optimisers & parameters via 'optimiser' argument to opt
##D opt_res <- opt(m, optimiser = bfgs())
##D 
##D # compare results with the analytic solution
##D opt_res$par
##D c(mean(x), sd(x))
## End(Not run)



