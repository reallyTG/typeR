library(RobustAFT)


### Name: TML.censored.control.S
### Title: Control parameters for the computation of the initial S
###   estimates in TML.censored
### Aliases: TML.censored.control.S

### ** Examples

     ### In the example(TML.censored), the control argument for the refinement 
     ### algorithm can be built using this function:

	 ## Not run: 
##D      data(MCI)
##D      attach(MCI)
##D      
##D      # Robust Accelerated Failure Time Regression with Gaussian errors
##D      ctrol.S   <- list(N=150, q=5, sigma0=1, MAXIT=100, TOL=0.001,seed=123)
##D 
##D      ctrol.ref <- TML.censored.control.ref(maxit.sigma=2,tol.sigma=0.0001,
##D                maxit.Beta=2,tol.Beta=0.0001, Maxit.S=50, tol.S.sigma=0.001, 
##D                tol.S.Beta=0.001,alg.sigma=1,nitmon=FALSE)
##D 
##D      ctrol.tml <- list(maxit.sigma=50,tol.sigma=0.0001,maxit.Beta=50,
##D                tol.Beta=0.0001, Maxit.TML=50, tol.TML.sigma=0.001, 
##D                tol.TML.Beta=0.001, alg.sigma=1,nitmon=FALSE)
##D      
##D      WML       <- TML.censored(log(LOS)~TypAdm*Age,data=MCI,delta=Dest,
##D                otp="adaptive",control.S=ctrol.S,control.ref=ctrol.ref,
##D                control.tml=ctrol.tml)
##D 
##D      summary(WML)
## End(Not run)



