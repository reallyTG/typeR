library(eco)


### Name: eco
### Title: Fitting the Parametric Bayesian Model of Ecological Inference in
###   2x2 Tables
### Aliases: eco
### Keywords: models

### ** Examples



## load the registration data
## Not run: 
##D data(reg)
##D 
##D ## NOTE: convergence has not been properly assessed for the following
##D ## examples. See Imai, Lu and Strauss (2008, 2011) for more
##D ## complete analyses.
##D 
##D ## fit the parametric model with the default prior specification
##D res <- eco(Y ~ X, data = reg, verbose = TRUE)
##D ## summarize the results
##D summary(res)
##D 
##D ## obtain out-of-sample prediction
##D out <- predict(res, verbose = TRUE)
##D ## summarize the results
##D summary(out)
##D 
##D ## load the Robinson's census data
##D data(census)
##D 
##D ## fit the parametric model with contextual effects and N 
##D ## using the default prior specification
##D res1 <- eco(Y ~ X, N = N, context = TRUE, data = census, verbose = TRUE)
##D ## summarize the results
##D summary(res1)
##D 
##D ## obtain out-of-sample prediction
##D out1 <- predict(res1, verbose = TRUE)
##D ## summarize the results
##D summary(out1)
## End(Not run)




