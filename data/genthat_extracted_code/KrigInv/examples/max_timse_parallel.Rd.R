library(KrigInv)


### Name: max_timse_parallel
### Title: Minimizer of the parallel timse criterion
### Aliases: max_timse_parallel

### ** Examples

#max_timse_parallel


set.seed(9)
N <- 20 #number of observations
T <- c(40,80) #thresholds
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

optimcontrol <- list(method="genoud",pop.size=200,optim.option=2)
integcontrol <- list(distrib="timse",n.points=400,init.distrib="MC")
integration.param <- integration_design(integcontrol=integcontrol,d=2,
                                            lower=lower,upper=upper,model=model,
                                            T=T)
batchsize <- 5 #number of new points

## Not run: 
##D obj <- max_timse_parallel(lower=lower,upper=upper,optimcontrol=optimcontrol,
##D                         batchsize=batchsize,T=T,model=model,
##D                         integration.param=integration.param,epsilon=0,imse=FALSE)
##D                         #5 optims in dimension 2 !
##D 
##D obj$par;obj$value #optimum in 5 new points
##D new.model <- update(object=model,newX=obj$par,newy=apply(obj$par,1,testfun),
##D                        cov.reestim=TRUE)
##D 
##D par(mfrow=c(1,2))
##D print_uncertainty(model=model,T=T,type="pn",lower=lower,upper=upper,
##D cex.points=2.5,main="probability of excursion")
##D 
##D print_uncertainty(model=new.model,T=T,type="pn",lower=lower,upper=upper,
##D new.points=batchsize,col.points.end="red",cex.points=2.5,
##D main="updated probability of excursion")
##D 
## End(Not run)



