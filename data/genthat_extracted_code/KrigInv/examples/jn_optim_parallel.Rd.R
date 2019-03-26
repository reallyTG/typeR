library(KrigInv)


### Name: jn_optim_parallel
### Title: Parallel jn criterion
### Aliases: jn_optim_parallel

### ** Examples

#jn_optim_parallel

set.seed(9)
N <- 20 #number of observations
T <- c(80,100) #thresholds
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
n.points <- 200
integcontrol <- list(n.points=n.points,distrib="jn",init.distrib="MC")
obj <- integration_design(integcontrol=integcontrol,
lower=c(0,0),upper=c(1,1),model=model,T=T)

integration.points <- obj$integration.points # (2n.points)*d matrix
integration.weights <- obj$integration.weights #vector of size n.points
pred <- predict_nobias_km(object=model,newdata=integration.points,
type="UK",se.compute=TRUE)
intpoints.oldmean <- pred$mean ; intpoints.oldsd<-pred$sd

#another precomputation
precalc.data <- precomputeUpdateData(model,integration.points)
nT <- 2 # number of thresholds
ai_precalc <- matrix(rep(intpoints.oldmean,times=nT),
    nrow=nT,ncol=length(intpoints.oldmean),byrow=TRUE)
ai_precalc <- ai_precalc - T  # substracts Ti to the ith row of ai_precalc

batchsize <- 4
x <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8)
#one evaluation of the sur_optim_parallel criterion
#we calculate the expectation of the future "sur" uncertainty 
#when 4 points are added to the doe
#the 4 points are (0.1,0.2) , (0.3,0.4), (0.5,0.6), (0.7,0.8)
jn_optim_parallel(x=x,integration.points=integration.points,
          integration.weights=integration.weights,
          intpoints.oldmean=intpoints.oldmean,intpoints.oldsd=intpoints.oldsd,
          precalc.data=precalc.data,T=T,model=model,
          batchsize=batchsize,current.sur=0,ai_precalc=ai_precalc)

# the criterion takes a negative value, which is normal.
# See the Technometrics paper in the references

#the function max_sur_parallel will help to find the optimum: 
#ie: the batch of 4 minimizing the expectation of the future uncertainty



