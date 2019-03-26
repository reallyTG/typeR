library(KrigInv)


### Name: predict_nobias_km
### Title: Kriging predictions
### Aliases: predict_nobias_km
### Keywords: models methods

### ** Examples

#predict_nobias_km
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

n.grid <- 100
x.grid <- y.grid <- seq(0,1,length=n.grid)

newdata <- expand.grid(x.grid,y.grid)
pred <- predict_nobias_km(object=model,newdata=newdata,type="UK",se.compute=TRUE)

z.grid1 <- matrix(pred$mean, n.grid, n.grid)
z.grid2 <- matrix(pred$sd, n.grid, n.grid)

par(mfrow=c(1,2))

#plots: contour of the kriging mean and stdev
image(x=x.grid,y=y.grid,z=z.grid1,col=grey.colors(10))
contour(x=x.grid,y=y.grid,z=z.grid1,15,add=TRUE)
points(design, col="black", pch=17, lwd=4,cex=2)
title("Kriging mean")

image(x=x.grid,y=y.grid,z=z.grid2,col=grey.colors(10))
contour(x=x.grid,y=y.grid,z=z.grid2,15,add=TRUE)
points(design, col="black", pch=17, lwd=4,cex=2)
title("Kriging standard deviation")



