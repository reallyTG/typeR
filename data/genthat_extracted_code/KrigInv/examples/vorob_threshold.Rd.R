library(KrigInv)


### Name: vorob_threshold
### Title: Calculation of the Vorob'ev threshold
### Aliases: vorob_threshold

### ** Examples

#vorob_threshold

set.seed(9)
N <- 20 #number of observations
T <- 80 #threshold
testfun <- branin

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
	response = response,covtype="matern3_2")

## Not run: 
##D ###we need to compute some additional arguments:
##D #integration points, and current kriging means and variances at these points
##D integcontrol <- list(n.points=50,distrib="sobol")
##D obj <- integration_design(integcontrol=integcontrol,
##D lower=c(0,0),upper=c(1,1),model=model,T=T)
##D 
##D integration.points <- obj$integration.points
##D 
##D pred <- predict_nobias_km(object=model,newdata=integration.points,
##D type="UK",se.compute=TRUE)
##D pn <- pnorm((pred$mean-T)/pred$sd)
##D 
##D vorob_threshold(pn)
## End(Not run)



