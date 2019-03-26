library(KrigInv)


### Name: timse_optim_parallel
### Title: Parallel targeted IMSE criterion
### Aliases: timse_optim_parallel

### ** Examples

#timse_optim_parallel

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
integcontrol <- list(n.points=1000,distrib="timse",init.distrib="MC")
obj <- integration_design(integcontrol=integcontrol,lower=c(0,0),
upper=c(1,1),model=model,T=T)

integration.points <- obj$integration.points
integration.weights <- obj$integration.weights
pred <- predict_nobias_km(object=model,newdata=integration.points,
type="UK",se.compute=TRUE)
intpoints.oldmean <- pred$mean ; intpoints.oldsd<-pred$sd

#another precomputation
precalc.data <- precomputeUpdateData(model,integration.points)

#we also need to compute weights. Otherwise the (more simple) 
#imse criterion will be evaluated
weight0 <- 1/sqrt( 2*pi*(intpoints.oldsd^2) )
weight <- 0
for(i in 1:length(T)){
  Ti <- T[i]
  weight <- weight + weight0 * exp(-0.5*((intpoints.oldmean-Ti)/sqrt(intpoints.oldsd^2))^2)
}

batchsize <- 4
x <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8)
#one evaluation of the timse_optim_parallel criterion
#we calculate the expectation of the future "timse" 
#uncertainty when 4 points are added to the doe
#the 4 points are (0.1,0.2) , (0.3,0.4), (0.5,0.6), (0.7,0.8)
timse_optim_parallel(x=x,integration.points=integration.points,
          integration.weights=integration.weights,
          intpoints.oldmean=intpoints.oldmean,intpoints.oldsd=intpoints.oldsd,
          precalc.data=precalc.data,T=T,model=model,weight=weight,
          batchsize=batchsize,current.timse=Inf)

#the function max_timse_parallel will help to find the optimum: 
#ie: the batch of 4 minimizing the expectation of the future uncertainty



