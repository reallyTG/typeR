library(KrigInv)


### Name: max_futureVol_parallel
### Title: Maximize parallel volume criterion
### Aliases: max_futureVol_parallel

### ** Examples

#max_futureVol_parallel

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

optimcontrol <- list(method="genoud",pop.size=200,optim.option=2)
integcontrol <- list(distrib="timse",n.points=400,init.distrib="MC")
integration.param <- integration_design(integcontrol=integcontrol,d=2,
                                        lower=lower,upper=upper,model=model,
                                        T=T)

batchsize <- 5 #number of new points

## Not run: 
##D   obj <- max_futureVol_parallel(lower=lower,upper=upper,optimcontrol=optimcontrol,
##D                             batchsize=batchsize,T=T,model=model,
##D                             integration.param=integration.param)
##D   #5 optims in dimension 2 !
##D 
##D   obj$par;obj$value #optimum in 5 new points
##D   new.model <- update(object=model,newX=obj$par,newy=apply(obj$par,1,testfun),
##D                       cov.reestim=TRUE)
##D 
##D   consLevel = 0.95; n_discrete_design=500*new.model@d
##D   CE_design=as.matrix (randtoolbox::sobol (n = n_discrete_design,
##D                               dim = new.model@d))
##D   colnames(CE_design) <- colnames(new.model@X)
##D   current.pred = predict.km(object = new.model,
##D                             newdata = CE_design,
##D                             type = "UK",cov.compute = TRUE)
##D   current.pred$cov <- current.pred$cov +1e-7*diag(nrow = nrow(current.pred$cov),
##D                                                   ncol = ncol(current.pred$cov))
##D 
##D   current.CE = anMC::conservativeEstimate(alpha = consLevel, pred=current.pred,
##D                                     design=CE_design, threshold=T, pn = NULL,
##D                                     type = ">", verb = 1,
##D                                     lightReturn = TRUE, algo = "GANMC")
##D 
##D   par(mfrow=c(1,2))
##D   print_uncertainty(model=model,T=T,type="pn",lower=lower,upper=upper,
##D                     cex.points=2.5,main="probability of excursion",consQuantile=obj$alpha)
##D 
##D   print_uncertainty(model=new.model,T=T,type="pn",lower=lower,upper=upper,
##D                     new.points=batchsize,col.points.end="red",cex.points=2.5,
##D                     main="updated probability of excursion",consQuantile=current.CE$lvs)
##D 
## End(Not run)



