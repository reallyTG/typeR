library(MuFiCokriging)


### Name: predict.MuFicokm
### Title: Predictions and confidence intervals of Multi-Kriging Cokriging
###   models at new data
### Aliases: predict.MuFicokm

### ** Examples

#--- test functions (see [Le GRATIET, L. 2012])
	Funcf <- function(x){return(0.5*(6*x-2)^2*sin(12*x-4)+sin(10*cos(5*x)))}
	Funcc <- function(x){return((6*x-2)^2*sin(12*x-4)+10*(x-0.5)-5)}
#--- Data
	Dc <- seq(0,1,0.1)
	indDf <- c(1,3,7,11)
	DNest <- NestedDesign(Dc, nlevel=2 , indices = list(indDf) )
	zc <- Funcc(DNest$PX)
	Df <- ExtractNestDesign(DNest,2)
	zf <- Funcf(Df)
#--- Multi-fidelity cokriging creation without parameter estimations
#--- "SK" : Simple CoKriging, i.e. when parameters are known
#--- "UK" : Universal CoKriging, i.e. when parameters are estimated
	#-- model creation
		mymodelSK <- MuFicokm(
				formula = list(~1,~1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2,
				coef.trend=list(0,2),
				coef.rho=list(0.5),
				coef.var=list(2,2),
				coef.cov=list(0.1,0.2))
	#-- predictions with "SK"
		predictionsSK <- predict(
				object = mymodelSK, 
				newdata = seq(0,1,le=100),
				type = "SK")

#--- Multi-fidelity co-kriging building with parameter estimations
	#-- model creation
		mymodelUK <- MuFicokm(
				formula = list(~1,~1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2)
	#-- predictions with "UK" 
		predictionsUK <- predict(
				object = mymodelUK, 
				newdata = seq(0,1,le=100),
				type = "UK")

#--- Multi-fidelity co-kriging building with known and unknown parameters
	#-- model creation
		mymodelSK_UK <- MuFicokm(
				formula = list(~1,~1),
				MuFidesign = DNest,
				response = list(zc,zf),
				nlevel = 2,
				coef.trend=list(-5,NULL),
				coef.rho=list(NULL),
				coef.var=list(2,NULL),
				coef.cov=list(0.1,NULL))
	#-- predictions with "UK" 
		predictionsSK_UK <- predict(
				object = mymodelSK_UK, 
				newdata = seq(0,1,le=100),
				type = list("SK","UK"))

#--- plot
	op <- par(mfrow=c(3,1))
		x <- seq(0,1,le=100)
		curve(Funcf,ylim=c(-5,10),main="SK")
		polygon(c(x,rev(x)), c(predictionsSK$mean+2*sqrt(predictionsSK$sig2), 
						rev(predictionsSK$mean-2*sqrt(predictionsSK$sig2))),
		col="gray", border = "red",density=20 )
		lines(seq(0,1,le=100), predictionsSK$mean,col=2,lty=2,lwd=2)

		curve(Funcf,ylim=c(-5,10),main="UK")
		polygon(c(x,rev(x)), c(predictionsUK$mean+2*sqrt(predictionsUK$sig2), 
						rev(predictionsUK$mean-2*sqrt(predictionsUK$sig2))),
		col="gray", border = "red",density=20 )
		lines(seq(0,1,le=100), predictionsUK$mean,col=2,lty=2,lwd=2)

		curve(Funcf,ylim=c(-5,10),main="mix SK & UK")
		polygon(c(x,rev(x)), c(predictionsSK_UK$mean+2*sqrt(predictionsSK_UK$sig2), 
						rev(predictionsSK_UK$mean-2*sqrt(predictionsSK_UK$sig2))),
		col="gray", border = "red",density=20 )
		lines(seq(0,1,le=100), predictionsSK_UK$mean,col=2,lty=2,lwd=2)
	par(op)



