library(KrigInv)


### Name: precomputeUpdateData
### Title: Useful precomputations to quickly update kriging mean and
###   variance
### Aliases: precomputeUpdateData

### ** Examples

#precomputeUpdateData

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

#the points where we want to compute prediction (if a point new.x is added to the doe)
n.grid <- 20 #you can run it with 100
x.grid <- y.grid <- seq(0,1,length=n.grid)
integration.points <- expand.grid(x.grid,y.grid)
integration.points <- as.matrix(integration.points)
precalc.data <- precomputeUpdateData(model=model,integration.points=integration.points)

#now we can compute quickly kriging covariances 
#between the integration.points and any other points
newdata <- matrix(c(0.6,0.6),ncol=2)
pred <- predict_nobias_km(object=model,newdata=newdata,type="UK",se.compute=TRUE)

kn <- computeQuickKrigcov(model=model,integration.points=integration.points,X.new=newdata,
                    precalc.data=precalc.data,F.newdata=pred$F.newdata,
                    c.newdata=pred$c)

z.grid <- matrix(kn, n.grid, n.grid)

#plots: contour of the covariances, DOE points and new point
#these covariances have been computed quickly with computeQuickKrigcov
image(x=x.grid,y=y.grid,z=z.grid,col=grey.colors(10))
contour(x=x.grid,y=y.grid,z=z.grid,15,add=TRUE)
points(design, col="black", pch=17, lwd=4,cex=2)
points(newdata, col="red", pch=17, lwd=4,cex=3)
title("Kriging covariances with the point (0.6,0.6), in red")



