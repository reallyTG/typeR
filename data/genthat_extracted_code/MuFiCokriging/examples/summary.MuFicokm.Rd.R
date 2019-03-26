library(MuFiCokriging)


### Name: summary.MuFicokm
### Title: Function summary for Multi-Fidelity Cokriging models
### Aliases: summary.MuFicokm

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
		mymodel <- MuFicokm(
				formula = list(~1,~1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2)

		sum <- summary(object = mymodel, CrossValidation = TRUE)
		names(sum)
#--- Saving parameters
	#--covariance parameters
		sum$Cov.Val
	#--variance parameters
		sum$Var.Val
	#--trend parameters
		sum$Trend.Val
	#-- adjustment parameters
		sum$Rho.Val



