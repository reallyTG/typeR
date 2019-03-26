library(KrigInv)


### Name: vorobVol_optim_parallel
### Title: Compute volume criterion
### Aliases: vorobVol_optim_parallel

### ** Examples

#vorobVol_optim_parallel

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

###we need to compute some additional arguments:
#integration points, and current kriging means and variances at these points
integcontrol <- list(n.points=50,distrib="vorob",init.distrib="MC")
obj <- integration_design(integcontrol=integcontrol,
                          lower=c(0,0),upper=c(1,1),model=model,T=T)

integration.points <- obj$integration.points
integration.weights <- obj$integration.weights


# alpha, the pn threshold should be computed with conservativeEstimate
# Here it is fixed at 0.992364
alpha <- 0.992364

## Not run: 
##D   # You can compute it with the following code
##D   CE_design=as.matrix (randtoolbox::sobol (n = 500*model@d,
##D                                            dim = model@d))
##D   colnames(CE_design) <- colnames(model@X)
##D 
##D   CE_pred = predict.km(object = model, newdata = CE_design,
##D                        type = "UK",cov.compute = TRUE)
##D   CE_pred$cov <- CE_pred$cov +1e-7*diag(nrow = nrow(CE_pred$cov),ncol = ncol(CE_pred$cov))
##D 
##D   Cestimate <- anMC::conservativeEstimate(alpha = 0.95, pred=CE_pred,
##D                                           design=CE_design, threshold=T, pn = NULL,
##D                                           type = ">", verb = 1,
##D                                           lightReturn = TRUE, algo = "GANMC")
##D   alpha <- Cestimate$lvs
## End(Not run)

pred <- predict_nobias_km(object=model,newdata=integration.points,
                          type="UK",se.compute=TRUE)
intpoints.oldmean <- pred$mean ; intpoints.oldsd<-pred$sd

#another precomputation
precalc.data <- precomputeUpdateData(model,integration.points)

batchsize <- 4
x <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8)
#one evaluation of the vorob_optim_parallel criterion
#we calculate the expectation of the future "vorob" uncertainty
#when 4 points are added to the doe
#the 4 points are (0.1,0.2) , (0.3,0.4), (0.5,0.6), (0.7,0.8)
vorobVol_optim_parallel(x=x,integration.points=integration.points,
                     integration.weights=integration.weights,
                     intpoints.oldmean=intpoints.oldmean,intpoints.oldsd=intpoints.oldsd,
                     precalc.data=precalc.data,T=T,model=model,
                     batchsize=batchsize,alpha=alpha)


#the function max_futureVol_parallel will help to find the optimum:
#ie: the batch of 4 maximizing the expectation of the future
# uncertainty (future volume of the Vorob'ev quantile)




