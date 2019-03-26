library(KrigInv)


### Name: EGI
### Title: Efficient Global Inversion: sequential inversion algorithm based
###   on Kriging.
### Aliases: EGI

### ** Examples

#EGI

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
integcontrol <- list(distrib="sur",n.points=50)
iter <- 1

## Not run: 
##D obj1 <- EGI(T=T,model=model,method="sur",fun=testfun,iter=iter,
##D            lower=lower,upper=upper,optimcontrol=optimcontrol,
##D            integcontrol=integcontrol)
##D 
##D obj2 <- EGI(T=T,model=model,method="ranjan",fun=testfun,iter=iter,
##D            lower=lower,upper=upper,optimcontrol=optimcontrol)
##D 
##D 
##D par(mfrow=c(1,3))
##D print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D type="pn",new.points=0,cex.points=2)
##D 
##D print_uncertainty_2d(model=obj1$lastmodel,T=T,
##D main="updated probability of excursion, sur sampling",
##D type="pn",new.points=iter,col.points.end="red",cex.points=2)
##D 
##D print_uncertainty_2d(model=obj2$lastmodel,T=T,
##D main="updated probability of excursion, ranjan sampling",
##D type="pn",new.points=iter,col.points.end="red",cex.points=2)
## End(Not run)
##############
#same example with noisy initial observations and noisy new observations
branin.noise <- function(x) return(branin(x)+rnorm(n=1,sd=30))

set.seed(9)
N <- 20;T <- 80
testfun <- branin.noise
lower <- c(0,0);upper <- c(1,1)

design <- data.frame( matrix(runif(2*N),ncol=2) )
response.noise <- apply(design,1,testfun)
response.noise - response


model.noise <- km(formula=~., design = design, response = response.noise,
covtype="matern3_2",noise.var=rep(30*30,times=N))

optimcontrol <- list(method="genoud",pop.size=50)
integcontrol <- list(distrib="sur",n.points=50)
iter <- 1

## Not run: 
##D obj1 <- EGI(T=T,model=model.noise,method="sur",fun=testfun,iter=iter,
##D            lower=lower,upper=upper,optimcontrol=optimcontrol,
##D            integcontrol=integcontrol,new.noise.var=30*30)
##D 
##D obj2 <- EGI(T=T,model=model.noise,method="ranjan",fun=testfun,iter=iter,
##D            lower=lower,upper=upper,optimcontrol=optimcontrol,
##D             new.noise.var=30*30)
##D 
##D par(mfrow=c(1,3))
##D print_uncertainty_2d(model=model.noise,T=T,
##D main="probability of excursion, noisy obs.",
##D type="pn",new.points=0,cex.points=2)
##D 
##D print_uncertainty_2d(model=obj1$lastmodel,T=T,
##D main="probability of excursion, sur sampling, noisy obs.",
##D type="pn",new.points=iter,col.points.end="red",cex.points=2)
##D 
##D print_uncertainty_2d(model=obj2$lastmodel,T=T,
##D main="probability of excursion, ranjan sampling, noisy obs.",
##D type="pn",new.points=iter,col.points.end="red",cex.points=2)
## End(Not run)


##############
# Conservative estimates with non-noisy initial observations
## Not run: 
##D   testfun <- branin
##D 
##D   ## Minimize Type II error sampling
##D 
##D   # The list method.param contains all parameters for the
##D   # conservative estimate and the conservative sequential
##D   # strategy. Below are parameters for a type II strategy
##D   # with conservative estimates at 0.95
##D   method.param = list(penalization=0, # Type II strategy
##D                       typeEx=">", consLevel = 0.95,
##D                       n_discrete_design=500*model@d)
##D   # If the CE for the initial model is already computed
##D   # it is possible to pass the conservative Vorob'ev quantile
##D   # level with method.param$consVorbLevel
##D 
##D   obj_T2 <- EGI(T=T,model=model,method="vorobCons",
##D                 fun=testfun,iter=iter,lower=lower,upper=upper,
##D                 optimcontrol=optimcontrol,
##D                 integcontrol=integcontrol,method.param=method.param)
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                        type="pn",new.points=0,cex.points=2,consQuantile = obj_T2$allCE_lvs[1])
##D 
##D   print_uncertainty_2d(model=obj_T2$lastmodel,T=T,
##D                        main="probability of excursion, parallel Type II sampling",
##D                        type="pn",new.points=iter,col.points.end="red",
##D                        cex.points=2,consQuantile = obj_T2$allCE_lvs[2])
##D 
##D   ## Maximize conservative estimate's volume
##D   # Set up method.param
##D   # Here we pass the conservative level computed
##D   # in the previous step for the initial model
##D   method.param = list(typeEx=">", consLevel = 0.95,
##D                       n_discrete_design=500*model@d,
##D                       consVorbLevel=obj_T2$allCE_lvs[1]
##D   )
##D 
##D   obj_consVol <- EGI(T=T,model=model,method="vorobVol",
##D                      fun=testfun,iter=iter,lower=lower,upper=upper,
##D                      optimcontrol=optimcontrol,
##D                      integcontrol=integcontrol,method.param=method.param)
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                        type="pn",new.points=0,cex.points=2,consQuantile = obj_consVol$allCE_lvs[1])
##D 
##D   print_uncertainty_2d(model=obj_consVol$lastmodel,T=T,
##D                        main="probability of excursion, parallel consVol sampling",
##D                        type="pn",new.points=iter,col.points.end="red",
##D                        cex.points=2,consQuantile = obj_consVol$allCE_lvs[2])
##D 
## End(Not run)




