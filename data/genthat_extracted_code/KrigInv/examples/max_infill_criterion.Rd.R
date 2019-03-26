library(KrigInv)


### Name: max_infill_criterion
### Title: Optimizer for the infill criteria
### Aliases: max_infill_criterion

### ** Examples

#max_infill_criterion

set.seed(9)
N <- 20 #number of observations
T <- 80 #threshold
testfun <- branin
lower <- c(0,0)
upper <- c(1,1)

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
	response = response,covtype="matern3_2")

optimcontrol <- list(method="genoud",pop.size=50)

## Not run: 
##D obj <- max_infill_criterion(lower=lower,upper=upper,optimcontrol=optimcontrol,
##D                              method="bichon",T=T,model=model)
##D 
##D obj$par;obj$value
##D new.model <- update(object=model,newX=obj$par,newy=testfun(obj$par),cov.reestim=TRUE)
##D 
##D par(mfrow=c(1,2))
##D print_uncertainty(model=model,T=T,type="pn",lower=lower,upper=upper,
##D cex.points=2.5,main="probability of excursion")
##D 
##D print_uncertainty(model=new.model,T=T,type="pn",lower=lower,upper=upper,
##D new.points=1,col.points.end="red",cex.points=2.5,main="updated probability of excursion")
## End(Not run)



