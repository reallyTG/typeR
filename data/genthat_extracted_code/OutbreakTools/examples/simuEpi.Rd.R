library(OutbreakTools)


### Name: simuEpi
### Title: Simulate an epidemic following a SIR model
### Aliases: simuEpi

### ** Examples

## Not run: 
##D ## Simulate an outbreak of 200 individuals over 20 time steps ##
##D set.seed(3)
##D 
##D x <- simuEpi(N = 200, D = 20, beta = 0.002, nu = 0.1, mu = 0.002)
##D 
##D ## x is a list:
##D class(x)
##D names(x)
##D 
##D ## x$dynamics contains demographic info
##D x$dynamics
##D 
##D ## x$plot is a ggplot object
##D class(x$plot)
##D x$plot
##D 
##D ## x$x is the obkData object
##D summary(x$x)
##D plotIndividualTimeline(x$x, colorBy="DateInfected")
##D 
##D 
##D ## Same, with a phylogenetic tree
##D x <- simuEpi(N = 200, D = 20, beta = 0.002, nu = 0.1, mu = 0.002,
##D              plot=TRUE, makePhyloTree=TRUE)
##D 
##D plotggphy(x$x, ladderize=TRUE, show.tip=TRUE,
##D       branch.unit="year", tip.label.size=4)
## End(Not run)



