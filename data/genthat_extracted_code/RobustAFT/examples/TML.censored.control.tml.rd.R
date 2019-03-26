library(RobustAFT)


### Name: TML.censored.control.tml
### Title: Control parameters for the IRLS algorithm of the final
###   TML.censored estimates
### Aliases: TML.censored.control.tml

### ** Examples

     ### In the example(TML.censored), the control argument for the final estimates 
	 ### can be built using this function:
	 
	 ## Not run: 
##D      data(MCI)
##D      attach(MCI)
##D      
##D      # Robust Accelerated Failure Time Regression with Gaussian errors
##D      ctrol.ref <- list(maxit.sigma=2,tol.sigma=0.0001,maxit.Beta=2,tol.Beta=0.0001,
##D            Maxit.S=50, tol.S.sigma=0.001, tol.S.Beta=0.001,alg.sigma=1,nitmon=FALSE)
##D 
##D      ctrol.tml <- TML.censored.control.tml(maxit.sigma=50,tol.sigma=0.0001,
##D            maxit.Beta=50,tol.Beta=0.0001, Maxit.TML=50, tol.TML.sigma=0.001, 
##D            tol.TML.Beta=0.001, alg.sigma=1,nitmon=FALSE)
##D      
##D      WML   <- TML.censored(log(LOS)~TypAdm*Age,data=MCI,delta=Dest,otp="adaptive",
##D            control.ref=ctrol.ref,control.tml=ctrol.tml)
##D 
##D      summary(WML)
## End(Not run)



