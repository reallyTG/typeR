library(surveillance)


### Name: plot.atwins
### Title: Plot results of a twins model fit
### Aliases: plot.atwins
### Keywords: ts regression

### ** Examples

## Not run: 
##D #Apparently, the algo.atwins can crash on some LINUX systems
##D #thus for now the example section is commented
##D 
##D #Load the data used in the Held et al. (2006) paper
##D data("hepatitisA")
##D 
##D #Fix seed - this is used for the MCMC samplers in twins
##D set.seed(123)
##D 
##D #Call algorithm and save result
##D otwins <- algo.twins(hepatitisA)
##D 
##D #This shows the entire output
##D plot(otwins,which=c(1,2),ask=FALSE)
## End(Not run)



