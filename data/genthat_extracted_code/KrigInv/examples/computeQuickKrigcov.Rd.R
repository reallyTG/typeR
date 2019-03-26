library(KrigInv)


### Name: computeQuickKrigcov
### Title: Quick computation of kriging covariances
### Aliases: computeQuickKrigcov

### ** Examples

#computeQuickKrigcov

set.seed(9)
N <- 20 #number of observations
testfun <- branin

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
            response = response,covtype="matern3_2")

#the integration.points are the points where we want to 
#compute predictions/covariances if a point new.x is added 
#to the DOE
x.grid <- seq(0,1,length=20)
integration.points <- expand.grid(x.grid,x.grid)
integration.points <- as.matrix(integration.points)

#precalculation
precalc.data <- precomputeUpdateData(model=model,
                     integration.points=integration.points)

#now we can compute quickly kriging covariances 
#between these data and any other points.
#example if 5 new points are added:
X.new <- matrix(runif(10),ncol=2)
pred <- predict_nobias_km(object=model,
                          newdata=X.new,type="UK",se.compute=TRUE)

kn <- computeQuickKrigcov(model=model,
                    integration.points=integration.points,X.new=X.new,
                    precalc.data=precalc.data,
                    F.newdata=pred$F.newdata,
                    c.newdata=pred$c)



