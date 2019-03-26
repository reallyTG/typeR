library(ctsem)


### Name: ctCI
### Title: ctCI Computes confidence intervals on specified parameters /
###   matrices for already fitted ctsem fit object.
### Aliases: ctCI

### ** Examples

## Examples set to 'dontrun' because they take longer than 5s.
## Not run: 
##D data("ctExample3")
##D model <- ctModel(n.latent = 1, n.manifest = 3, Tpoints = 100, 
##D  LAMBDA = matrix(c(1, "lambda2", "lambda3"), nrow = 3, ncol = 1), 
##D  MANIFESTMEANS = matrix(c(0, "manifestmean2", "manifestmean3"), nrow = 3, 
##D    ncol = 1))
##D fit <- ctFit(dat = ctExample3, ctmodelobj = model, objective = "Kalman",
##D  stationary = c("T0VAR"))
##D 
##D fit <- ctCI(fit, confidenceintervals = 'DRIFT')
##D 
##D summary(fit)$omxsummary$CI
## End(Not run)



