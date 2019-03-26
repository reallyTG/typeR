library(RCPmod)


### Name: cooks.distance.regimix
### Title: Calculates leave-some-out statistics for a regimix object,
###   principally a version of Cook's distance and cross-validated
###   predictive logl
### Aliases: cooks.distance.regimix
### Keywords: misc

### ** Examples

## Not run: 
##D #not run as R CMD check complains about the time taken.
##D #This code will take a little while to run (<1 minute on my computer)
##D #For leave-one-out cooks distance, use oosSize=1
##D #for serious use times will need to be larger.
##D system.time({
##D example( regimix);
##D cooksD <- cooks.distance( fm, oosSize=10, times=25)
##D })
##D example( regimix)  #will fit a model and store in fm
##D #for serious use times will need to be larger.
##D #For leave-one-out cooks distance, use oosSize=1
##D cooksD <- cooks.distance( fm, oosSize=10, times=5)
## End(Not run)



