library(tsDyn)


### Name: VECM.sim
### Title: Simulation and bootstrap a VECM or bivariate TVECM
### Aliases: VECM.sim VECM.boot TVECM.boot TVECM.sim
### Keywords: ts

### ** Examples



###reproduce example in Enders (2004, 2 edition) p. 350, 
# (similar example in Enders (2010, 3 edition) 301-302). 

if(require(mnormt)){
#see that the full "VAR" coefficient matrix is:
 A <- matrix(c(-0.2, 0.2, 0.2, -0.2), byrow=TRUE, ncol=2)

# but this is not the input of VECM.sim. You should decompose into the a and b matrix:
 a<-matrix(c(-0.2, 0.2), ncol=1)
 b<-matrix(c(1,-1), nrow=1)

# so that:
 a%*%b

# The a matrix is the input under argument B, while the b matrix is under argument beta: 
# (the other zeros in B are for the not-specified lags)
 innov<-rmnorm(100, varcov=diag(2))
 startVal <- matrix(0, nrow=2, ncol=1)
 Bvecm <- rbind(c(-0.2, 0,0), c(0.2, 0,0))
 vecm1 <- VECM.sim(B=Bvecm, beta=1,n=100, lag=1,include="none", innov=innov, starting=startVal)
 ECT <- vecm1[,1]-vecm1[,2]

#add an intercept as in panel B
 Bvecm2 <- rbind(c(-0.2, 0.1,0,0), c(0.2,0.4, 0,0))
 vecm2 <- VECM.sim(B=Bvecm2,  n=100,beta=1, lag=1,include="const", innov=innov, starting=startVal)

 par(mfrow=c(2,1))
 plot(vecm1[,1], type="l", main="Panel a: no drift or intercept", ylab="", xlab="")
 lines(vecm1[,2], lty=2)
 plot(vecm2[,1], type="l", main="Panel b: drift terms (0.1)", ylab="", xlab="")
 lines(vecm2[,2], lty=2)
}
##Bootstrap a TVAR with 1 threshold (two regimes)
data(zeroyld)
dat<-zeroyld
TVECMobject<-TVECM(dat, nthresh=1, lag=1, ngridBeta=20, ngridTh=20, plot=FALSE)
TVECM.sim(TVECMobject=TVECMobject,type="boot")

##Check the bootstrap
TVECM.sim.check <- TVECM.sim(TVECMobject=TVECMobject,type="check")
all(TVECM.sim.check==dat)




