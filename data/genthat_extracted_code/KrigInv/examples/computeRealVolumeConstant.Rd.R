library(KrigInv)


### Name: computeRealVolumeConstant
### Title: A constant used to calculate the expected excursion set's volume
###   variance
### Aliases: computeRealVolumeConstant

### ** Examples

#computeRealVolumeConstant

set.seed(9)
N <- 20 #number of observations
testfun <- branin
T <- 80

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
            response = response,covtype="matern3_2")

integcontrol <- list(n.points=500,distrib="jn",init.distrib="MC")
obj <- integration_design(integcontrol=integcontrol,
	lower=c(0,0),upper=c(1,1),model=model,T=T)
	
integration.points <- obj$integration.points
integration.weights <- obj$integration.weights

## Not run: 
##D computeRealVolumeConstant(model=model,
##D 	integration.points=integration.points,
##D         integration.weights=integration.weights,T=T)
## End(Not run)



