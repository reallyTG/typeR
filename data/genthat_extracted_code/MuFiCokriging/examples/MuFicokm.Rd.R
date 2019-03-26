library(MuFiCokriging)


### Name: MuFicokm
### Title: Creation of Multi-Fidelity Cokriging models
### Aliases: MuFicokm

### ** Examples


#-------------------------------------------------------------------
#- 3 Dimensional test with 3 levels of response
#-------------------------------------------------------------------
#--- test functions
	myfunc1 <- function(x){sin(2*pi*x[,1])*0.2*(x[,2]+2)^2+cos(4*pi*x[,3])^2}
	myfunc2 <- function(x){2*myfunc1(x)+x[,3]}
	myfunc3 <- function(x){3*myfunc2(x)+x[,2]+x[,1]}
#--- Data
	#-- Nested Experimental design sets
		nD1 <- 100
		nD2 <- 50		
		nD3 <- 20
		set.seed(1);D1 <- matrix(runif(n=nD1*3, 0,1),ncol=3)
		set.seed(2);D2 <- matrix(runif(n=nD2*3, 0,1),ncol=3)
		set.seed(3);D3 <- matrix(runif(n=nD3*3, 0,1),ncol=3)
		NestDesign  <- NestedDesignBuild(design = list(D1,D2,D3))
	#-- observations
		z1 <- myfunc1(NestDesign$PX)
		z2 <- myfunc2(ExtractNestDesign(NestDesign,2))
		z3 <- myfunc3(ExtractNestDesign(NestDesign,3))
#--- Multi-fidelity cokriging creation
		mymodel <- MuFicokm(
			formula = list(~1,~1+X2,~1+X3), 
			MuFidesign = NestDesign, 
			response = list(z1,z2,z3), 
			nlevel = 3)
#--- Multi-fidelity cokriging prediction
		newdata <- matrix(runif(333,0,1),ncol=3)
		predictions <- predict(mymodel, newdata, "UK")
		z.pred <- predictions$mean
#--- Multi-fidelity cokriging cross Validation
		set.seed(1);indice <- sample(1:nD3)[1:10]
	#-- Observations removing from the highest level
		resCV.cok <- CrossValidationMuFicokm(mymodel,indice)
	#-- Observations removing from all levels
		resCV.cok.all <- CrossValidationMuFicokmAll(mymodel,indice)
#--- Multi-fidelity cokriging summary
		sum <- summary(mymodel)

#-------------------------------------------------------------------
#- 1 Dimensional test with 2 levels of response
#-------------------------------------------------------------------

#--- test functions
	Funcf <- function(x){return((6*x-2)^2*sin(12*x-4))}
	Funcc <- function(x){return(0.5*Funcf(x)+10*(x-0.5)-5)}
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
				nlevel = 2,
				covtype = list("gauss","matern5_2"),
				coef.trend=list(-5,3),
				coef.rho=list(2),
				coef.var=list(2,2),
				coef.cov=list(0.1,0.2))
		predictions <- predict(
				object = mymodel, 
				newdata = seq(0,1,le=100),
				type = "SK")
#--- Multi-fidelity cokriging creation with parameter estimations
		mymodel <- MuFicokm(
				formula = list(~1,~1+X1), 
				MuFidesign = DNest, 
				response = list(zc,zf), 
				nlevel = 2,
				covtype = "matern5_2")
		predictions <- predict(
				object = mymodel, 
				newdata = seq(0,1,le=100),
				type="UK")



