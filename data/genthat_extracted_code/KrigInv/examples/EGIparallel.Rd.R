library(KrigInv)


### Name: EGIparallel
### Title: Efficient Global Inversion: parallel version to get batchsize
###   locations at each iteration
### Aliases: EGIparallel

### ** Examples

#EGIparallel

set.seed(9)
N <- 20 #number of observations
T <- c(20,60) #thresholds
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
batchsize <- 6

## Not run: 
##D   obj <- EGIparallel(T=T,model=model,method="sur",batchsize=batchsize,
##D                      fun=testfun,iter=iter,lower=lower,upper=upper,
##D                      optimcontrol=optimcontrol,integcontrol=integcontrol)
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                        type="pn",new.points=0,cex.points=2)
##D 
##D   print_uncertainty_2d(model=obj$lastmodel,T=T,
##D                        main="probability of excursion, parallel sur sampling",
##D                        type="pn",new.points=iter*batchsize,col.points.end="red",cex.points=2)
## End(Not run)

##############
#same example with noisy initial observations and noisy new observations
branin.noise <- function(x) return(branin(x)+rnorm(n=1,sd=30))

set.seed(9)
N <- 20;T <- c(20,60)
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
batchsize <- 6

## Not run: 
##D   obj <- EGIparallel(T=T,model=model.noise,method="sur",batchsize=batchsize,
##D                      fun=testfun,iter=iter,lower=lower,upper=upper,
##D                      optimcontrol=optimcontrol,integcontrol=integcontrol,
##D                      new.noise.var=10*10)
##D 
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model.noise,T=T,
##D                        main="probability of excursion, noisy obs.",
##D                        type="pn",new.points=0,cex.points=2)
##D 
##D   print_uncertainty_2d(model=obj$lastmodel,T=T,
##D                        main="probability of excursion, parallel sur sampling, noisy obs.",
##D                        type="pn",new.points=iter*batchsize,col.points.end="red",cex.points=2)
## End(Not run)


##############
# Conservative estimates with non-noisy initial observations
## Not run: 
##D   testfun <- branin
##D   # The conservative sampling strategies
##D   # only work with 1 threshold
##D   T <- 20
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
##D   obj_T2 <- EGIparallel(T=T,model=model,method="vorobCons",batchsize=batchsize,
##D                         fun=testfun,iter=iter,lower=lower,upper=upper,
##D                         optimcontrol=optimcontrol,
##D                         integcontrol=integcontrol,method.param=method.param)
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                        type="pn",new.points=0,cex.points=2,consQuantile = obj_T2$allCE_lvs[1])
##D 
##D   print_uncertainty_2d(model=obj_T2$lastmodel,T=T,
##D                        main="probability of excursion, parallel Type II sampling",
##D                        type="pn",new.points=iter*batchsize,col.points.end="red",
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
##D   obj_consVol <- EGIparallel(T=T,model=model,method="vorobVol",batchsize=batchsize,
##D                              fun=testfun,iter=iter,lower=lower,upper=upper,
##D                              optimcontrol=optimcontrol,
##D                              integcontrol=integcontrol,method.param=method.param)
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                        type="pn",new.points=0,cex.points=2,consQuantile = obj_consVol$allCE_lvs[1])
##D 
##D   print_uncertainty_2d(model=obj_consVol$lastmodel,T=T,
##D                        main="probability of excursion, parallel consVol sampling",
##D                        type="pn",new.points=iter*batchsize,col.points.end="red",
##D                        cex.points=2,consQuantile = obj_consVol$allCE_lvs[2])
##D 
## End(Not run)




