library(surveillance)


### Name: algo.farrington
### Title: Surveillance for a count data time series using the Farrington
###   method.
### Aliases: algo.farrington
### Keywords: classif

### ** Examples

#Read Salmonella Agona data
data("salmonella.agona")

#Do surveillance for the last 100 weeks.
n <- length(salmonella.agona$observed)
#Set control parameters.
control <- list(b=4,w=3,range=(n-100):n,reweight=TRUE, verbose=FALSE,alpha=0.01)
res <- algo.farrington(salmonella.agona,control=control)
#Plot the result.
plot(res,disease="Salmonella Agona",method="Farrington")

## Not run: 
##D #Generate Poisson counts and convert into an "sts" object
##D set.seed(123)
##D x <- rpois(520,lambda=1)
##D sts <- sts(observed=x, state=x*0, freq=52)
##D 
##D #Compare timing of the two possible fitters for algo.farrington (here using S4)
##D system.time( sts1 <- farrington(sts, control=list(range=312:520,
##D                        fitFun="algo.farrington.fitGLM.fast")))
##D system.time( sts2 <- farrington(sts, control=list(range=312:520,
##D                        fitFun="algo.farrington.fitGLM")))
##D 
##D #Check if results are the same
##D stopifnot(upperbound(sts1) == upperbound(sts2))
## End(Not run)



