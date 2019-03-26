library(VGAM)


### Name: rcqo
### Title: Constrained Quadratic Ordination
### Aliases: rcqo
### Keywords: distribution datagen

### ** Examples

## Not run: 
##D # Example 1: Species packing model:
##D n <- 100; p <- 5; S <- 5
##D mydata <- rcqo(n, p, S, es.opt = TRUE, eq.max = TRUE)
##D names(mydata)
##D (myform <- attr(mydata, "formula"))
##D fit <- cqo(myform, poissonff, mydata, Bestof = 3)  # eq.tol = TRUE
##D matplot(attr(mydata, "latvar"), mydata[,-(1:(p-1))], col = 1:S)
##D persp(fit, col = 1:S, add = TRUE)
##D lvplot(fit, lcol = 1:S, y = TRUE, pcol = 1:S)  # The same plot as above
##D 
##D # Compare the fitted model with the 'truth'
##D concoef(fit)  # The fitted model
##D attr(mydata, "concoefficients")  # The 'truth'
##D 
##D c(apply(attr(mydata, "latvar"), 2, sd),
##D   apply(latvar(fit), 2, sd))  # Both values should be approx equal
##D 
##D 
##D # Example 2: negative binomial data fitted using a Poisson model:
##D n <- 200; p <- 5; S <- 5
##D mydata <- rcqo(n, p, S, fam = "negbin", sqrt = TRUE)
##D myform <- attr(mydata, "formula")
##D fit <- cqo(myform, fam = poissonff, dat = mydata)  # I.tol = TRUE,
##D lvplot(fit, lcol = 1:S, y = TRUE, pcol = 1:S)
##D # Compare the fitted model with the 'truth'
##D concoef(fit)  # The fitted model
##D attr(mydata, "concoefficients")  # The 'truth'
## End(Not run)



