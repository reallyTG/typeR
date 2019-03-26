library(bsamGP)


### Name: bsad
### Title: Bayesian Semiparametric Density Estimation
### Aliases: bsad
### Keywords: logistic Gaussian process density estimation

### ** Examples

## Don't show: 
set.seed(1)
x <- rgamma(50,2,1)

# mcmc parameters
mcmc <- list(nblow = 100,
             smcmc = 100,
             nskip = 1,
             ndisp = 100,
             kappaloop = 1)

# fits BSAD model
fout <- bsad(x = x, xmin = 0, xmax = 10, nint = 501, mcmc = mcmc,
            smoother = 'geometric', parametric = 'gamma')

# Summary
print(fout); summary(fout)

# fitted values
fit <- fitted(fout, HPD = FALSE)

# predictive density plot
plot(fit, ask = FALSE)
## End(Don't show)
## Not run: 
##D ############################
##D # Old Faithful geyser data #
##D ############################
##D data(faithful)
##D attach(faithful)
##D 
##D # mcmc parameters
##D mcmc <- list(nblow = 10000,
##D 	           smcmc = 1000,
##D 	           nskip = 10,
##D 	           ndisp = 1000,
##D 	           kappaloop = 5)
##D 
##D # fits BSAD model
##D fout <- bsad(x = eruptions, xmin = 0, xmax = 8, nint = 501, mcmc = mcmc,
##D              smoother = 'geometric', parametric = 'gamma')
##D 
##D # Summary
##D print(fout); summary(fout)
##D 
##D # fitted values
##D fit <- fitted(fout)
##D 
##D # predictive density plot
##D plot(fit, ask = TRUE)
##D 
##D detach(faithful)
## End(Not run)



