library(KrigInv)


### Name: max_sur_parallel
### Title: Minimizer of the parallel '"sur"' or '"jn"' criterion
### Aliases: max_sur_parallel

### ** Examples

#max_sur_parallel


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

optimcontrol <- list(method="genoud",pop.size=50,optim.option=1)
integcontrol <- list(distrib="sur",n.points=50,init.distrib="MC")
integration.param <- integration_design(integcontrol=integcontrol,d=2,
                                            lower=lower,upper=upper,model=model,
                                            T=T)
batchsize <- 5 #number of new points

## Not run: 
##D obj <- max_sur_parallel(lower=lower,upper=upper,optimcontrol=optimcontrol,
##D                         batchsize=batchsize,T=T,model=model,
##D                         integration.param=integration.param)
##D                         #one (hard) optim in dimension 5*2 !
##D 
##D obj$par;obj$value #optimum in 5 new points
##D new.model <- update(object=model,newX=obj$par,newy=apply(obj$par,1,testfun),
##D                        cov.reestim=TRUE)
##D 
##D 
##D par(mfrow=c(1,2))
##D print_uncertainty(model=model,T=T,type="pn",lower=lower,upper=upper,
##D cex.points=2.5,main="probability of excursion")
##D 
##D print_uncertainty(model=new.model,T=T,type="pn",lower=lower,upper=upper,
##D new.points=batchsize,col.points.end="red",cex.points=2.5,
##D main="updated probability of excursion")
## End(Not run)



