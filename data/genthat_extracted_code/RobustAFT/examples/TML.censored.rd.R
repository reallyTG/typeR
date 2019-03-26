library(RobustAFT)


### Name: TML.censored
### Title: Truncated Maximum Likelihood Regression With Censored
###   Observations
### Aliases: TML.censored
### Keywords: Regression Robust Accelerated Failure Time

### ** Examples

     # This is the example described in Locatelli et al. (2010). 
     # The estimates are slighty different than those of the paper due to changes 
     # in the algorithm for the final estimate.
     #
## Not run: 
##D      data(MCI)
##D      attach(MCI)
##D      
##D      # Exploratory Analysis
##D      plot(Age,log(LOS),type= "n",cex=0.7)
##D 
##D      # (1) filled square : regular,   complete
##D      # (2) empty  square : regular,   censored
##D      # (3) filled triangle : emergency, complete
##D      # (4) empty  triangle : emergency, censored
##D 
##D      points(Age[Dest==1 & TypAdm==0], log(LOS)[Dest==1 & TypAdm==0], pch=15,cex=0.7) # (1)
##D      points(Age[Dest==0 & TypAdm==0], log(LOS)[Dest==0 & TypAdm==0], pch=0, cex=0.7) # (2) 
##D      points(Age[Dest==1 & TypAdm==1], log(LOS)[Dest==1 & TypAdm==1], pch=17,cex=0.7) # (3) 
##D      points(Age[Dest==0 & TypAdm==1], log(LOS)[Dest==0 & TypAdm==1], pch=2, cex=0.7) # (4) 
##D 
##D      # Maximum Likelihood
##D      ML   <- survreg(Surv(log(LOS), Dest) ~ TypAdm*Age, dist="gaussian")
##D      summary(ML)
##D      B.ML <- ML$coef
##D      S.ML <- ML$scale
##D      
##D      abline(c(B.ML[1]        ,B.ML[3]        ),lwd=1,col="grey",lty=1)
##D      abline(c(B.ML[1]+B.ML[2],B.ML[3]+B.ML[4]),lwd=1,col="grey",lty=1)
##D      
##D      # Robust Accelerated Failure Time Regression with Gaussian errors
##D      ctrol.S   <- list(N=150, q=5, sigma0=1, MAXIT=100, TOL=0.001,seed=123)
##D 
##D      ctrol.ref <- list(maxit.sigma=2,tol.sigma=0.0001,maxit.Beta=2,tol.Beta=0.0001,
##D            Maxit.S=50, tol.S.sigma=0.001, tol.S.Beta=0.001,alg.sigma=1,nitmon=FALSE)
##D 
##D      ctrol.tml <- list(maxit.sigma=50,tol.sigma=0.0001,maxit.Beta=50,tol.Beta=0.0001,
##D       Maxit.TML=50, tol.TML.sigma=0.001, tol.TML.Beta=0.001, alg.sigma=1,nitmon=FALSE)
##D      
##D      WML<-TML.censored(log(LOS)~TypAdm*Age,data=MCI,delta=Dest,otp="adaptive",
##D           control.S=ctrol.S,control.ref=ctrol.ref,control.tml=ctrol.tml)
##D 
##D      summary(WML)
##D      
##D      B.WML<-coef(WML)
##D      abline(c(B.WML[1]         ,B.WML[3]         ),lty=1, col="red")
##D      abline(c(B.WML[1]+B.WML[2],B.WML[3]+B.WML[4]),lty=1, col="red")
## End(Not run)



