library(RandomFields)


### Name: RFcrossvalidate
### Title: Fitting model parameters to spatial data (regionalised
###   variables) and to linear (mixed) models
### Aliases: RFcrossvalidate print.crossvalidate summary.crossvalidate
###   print.summary.crossvalidate RFcrossvalidate.default
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


## currently disabled!

## Don't show: ## Not run: 
##D 
##D ## See also  papers.jss14.rd !!!!
##D 
##D RFoptions(modus_operandi="sloppy")
##D 
##D 
##D #########################################################
##D ## simulate some data first
##D points <- 100
##D x <- runif(points, 0, 3)
##D y <- runif(points, 0, 3) ## random points in square [0, 3]^2
##D model <- RMgencauchy(alpha=1, beta=2)
##D d <- RFsimulate(model, x=x, y=y, grid=FALSE, n=n=100) #better n=1000
##D 
##D 
##D #########################################################
##D ## estimation; 'NA' means: "to be estimated"
##D estmodel <- RMgencauchy(var=NA, scale=NA, alpha=NA, beta=2) +
##D             RMtrend(mean=NA)
##D RFcrossvalidate(estmodel, data=d)
##D 
## End(Not run)## End(Don't show)

## Don't show: 
RFoptions(modus_operandi="normal")
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


