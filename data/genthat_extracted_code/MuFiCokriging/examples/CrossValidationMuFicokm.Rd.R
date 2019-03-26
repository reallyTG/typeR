library(MuFiCokriging)


### Name: CrossValidationMuFicokm
### Title: Cross Validation Procedure for Multi-Fidelity Cokriging models
###   when the observations are removed from the code with the highest
###   level of fidelity
### Aliases: CrossValidationMuFicokm

### ** Examples

#--- test functions (see [Le GRATIET, L. 2012])
	Funcf <- function(x){return(0.5*(6*x-2)^2*sin(12*x-4)+sin(10*cos(5*x)))}
	Funcc <- function(x){return((6*x-2)^2*sin(12*x-4)+10*(x-0.5)-5)}
#--- Data
	Dc <- seq(0,1,0.1)
	indDf <- c(1,3,7,11)
	DNest <- NestedDesign(Dc, nlevel=2 , indices = list(indDf) )
	zc <- Funcc(DNest$PX)
	zf <- Funcf(ExtractNestDesign(DNest,2))

#--- Model creation
		mymodel <- MuFicokm(
				formula = list(~1,~1+X1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2,
				covtype = "matern5_2")
#--- Cross Validation on points number  1 and 3
		indice <- c(1,3)
		CrossValidationMuFicokm(mymodel,indice)
#--- Leave-One-Out Cross Validation
	#-- LOO CV predictive errors
		apply(matrix(1:DNest$n),1,function(x) CrossValidationMuFicokm(mymodel,x)$CVerr)
	#-- LOO CV predictive variances
		apply(matrix(1:DNest$n),1,function(x) CrossValidationMuFicokm(mymodel,x)$CVvar)



