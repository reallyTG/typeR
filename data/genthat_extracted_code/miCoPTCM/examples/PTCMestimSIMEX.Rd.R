library(miCoPTCM)


### Name: PTCMestimSIMEX
### Title: SIMEX approach
### Aliases: PTCMestimSIMEX PTCMestimSIMEX.default PTCMestimSIMEX.formula
###   print.PTCMestimSIMEX summary.PTCMestimSIMEX
###   print.summary.PTCMestimSIMEX

### ** Examples

## Not run: 
##D library("survival")
##D ## Data generation
##D set.seed(123)
##D n <- 200
##D varCov <- matrix(nrow=3,ncol=3,0)
##D varCov[2,2] <- 0.1^1
##D X1 <- (runif(n)-.5)/sqrt(1/12) 
##D V <- round(X1 + rnorm(n,rep(0,3),varCov[2,2]),7)# covariate with measurement error
##D Xc <- round(as.numeric(runif(n)<0.5),7) # covariate without measurement error
##D 
##D  # censoring times: truncated exponential distribution
##D C <- round(rexp(n,1/5),5) 
##D Cbin <- (C>30)
##D while(sum(Cbin)>0)
##D {
##D 	C[Cbin] <- round(rexp(sum(Cbin),1/5),5)
##D 	Cbin <- (C>30)
##D }
##D 
##D expb <- exp(0.5+X1-0.5*Xc) 
##D cure <- exp(-expb) # cure probabilities
##D 
##D  # event times with baseline cdf of a truncated exponential 
##D U <- runif(n)
##D d <- rep(NA,n)
##D T <- round(-6*log( 1+ (1-exp(-20/6))*log(1-(1-cure)*U)/expb ),5) 
##D T[(runif(n)<cure)] <- 99999 # cured subjects
##D 
##D Tobs <- rep(NA,n)
##D Tobs <- pmin(C,T) # observed times
##D Tmax <- max(Tobs[Tobs==T])
##D d <- (Tobs==T) # censoring indicator
##D 	
##D Dat <- data.frame(Tobs,d,V,Xc)
##D 
##D ## Model estimation
##D fm <- formula(Surv(Tobs,d) ~ V + Xc)
##D resSimex <- PTCMestimSIMEX(fm, Dat, errorDistEstim="normal", 
##D varCov=varCov,  nBack=10000, eps=1e-8, 
##D Nu=c(0,.5,1,1.5,2), B=50, init=rnorm(3), orderExtrap=1:3, multMaxTime=2)
##D resSimex
##D summary(resSimex)
## End(Not run)



