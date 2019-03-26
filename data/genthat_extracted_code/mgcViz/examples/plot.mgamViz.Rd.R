library(mgcViz)


### Name: plot.mgamViz
### Title: Plotting multiple quantile GAMs
### Aliases: plot.mgamViz

### ** Examples

## Not run: 
##D library(mgcViz)
##D set.seed(2) ## simulate some data...
##D dat <- gamSim(1,n=500,dist="normal",scale=2)
##D dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) )
##D 
##D dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) )
##D 
##D # Fit GAM and get gamViz object
##D fit <- mqgamV(y ~ fac + s(x0) + s(x1, x2) + x3 + logi, data = dat, 
##D               qu = c(0.2, 0.4, 0.6, 0.8))
##D 
##D print(plot(fit, select = 1:4, allTerms = T), pages = 1)
##D 
##D # Example where we are fitting the same model to different datasets, but
##D # plotting the estimate effects together 
##D dat <- list()
##D for(ii in 1:4){
##D   # Simulate 4 datasets, we are adding 2 factor variables "fac" and "ref" just
##D   # for illustrating the plotting method (the two factors have no effect on y)
##D   n <- 1000
##D   dat[[ii]] <- gamSim(1,n=n,dist="normal",scale=2)
##D   dat[[ii]]$fac <- as.factor( sample(c("A1", "A2", "A3"), n, replace = TRUE) )
##D   dat[[ii]]$ref <- as.factor( sample(letters[1:10], n, replace = TRUE) )
##D }
##D 
##D # Estimating model on each dataset
##D mods <- list()
##D for(ii in 1:4){
##D   mods[[ii]] <- gamV(y~s(x0)+s(x1, x2)+x3+fac+s(ref, bs = "re"), data = dat[[ii]])
##D }
##D 
##D # Names will be used to identify the four models we have fitted 
##D names(mods) <- c("M1", "M2", "M3", "M4")
##D # Plotting on the same plots
##D print(plot.mgamViz(mods, allTerms = TRUE), pages = 1)
## End(Not run)




