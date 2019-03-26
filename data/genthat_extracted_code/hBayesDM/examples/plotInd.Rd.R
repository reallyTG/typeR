library(hBayesDM)


### Name: plotInd
### Title: Plots individual posterior distributions, using the stan_plot
###   function of the rstan package
### Aliases: plotInd

### ** Examples

## Not run: 
##D # Run a model
##D output <- dd_hyperbolic("example", 2000, 1000, 3, 3)
##D 
##D # Plot the hyper parameters ('k' and 'beta')
##D plot(output)
##D 
##D # Plot individual 'k' (discounting rate) parameters
##D plotInd(output, "k")
##D 
##D # Plot individual 'beta' (inverse temperature) parameters
##D plotInd(output, "beta")
##D 
##D # Plot individual 'beta' parameters but don't show density
##D plotInd(output, "beta", show_density = F)
## End(Not run)



