library(MuFiCokriging)


### Name: CrossValidationMuFicokmAll
### Title: Cross Validation Procedure for Multi-Fidelity Cokriging models
###   when the observations are removed from all code levels.
### Aliases: CrossValidationMuFicokmAll

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

#--- Model creation with parameter estimations
		mymodel <- MuFicokm(
				formula = list(~1,~1+X1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2,
				covtype = "matern5_2")
#--- Cross Validation
		indice <- c(1,3)
		CVAll <- CrossValidationMuFicokmAll(mymodel,indice)
	#-- predictive errors when we remove the observations from Funcf and Funcc
		CVAll$CVerrall
	#-- predictive variances when we remove the observations from Funcf and Funcc
		CVAll$CVvarall
	#-- predictive covariance matrix when we remove the observations from Funcf and Funcc
		CVAll$CVCovall
	#-- predictive errors when we remove the observations from Funcf
		CVAll$CVerr[[1]]
	#-- predictive variances when we remove the observations from Funcf
		CVAll$CVvar[[1]]
	#-- predictive covariance matrix when we remove the observations from Funcf
		CVAll$CVCov[[1]]

#--- Leave-One-Out Cross Validation
	#-- LOO CV predictive errors
		apply(matrix(1:DNest$n),1,function(x) CrossValidationMuFicokmAll(mymodel,x)$CVerrall)



