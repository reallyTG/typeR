library(rvalues)


### Name: rvalues
### Title: R-values
### Aliases: rvalues
### Keywords: hstat models

### ** Examples

## Not run: 
##D ### Binomial example with Beta prior:
##D data(fluEnrich)
##D flu.rvals <- rvalues(fluEnrich, family = binomial)
##D hist(flu.rvals$rvalues)
##D 
##D ### look at the r-values for indices 10 and 2484
##D fig_indices  <- c(10,2484)
##D fluEnrich[fig_indices,]
##D 
##D flu.rvals$rvalues[fig_indices]
##D 
##D ### Gaussian sampling distribution with nonparametric prior
##D ### Use a maximum of 5 iterations for the nonparam. estimate
##D data(hiv)
##D hiv.rvals <- rvalues(hiv, prior = "nonparametric")
## End(Not run)



