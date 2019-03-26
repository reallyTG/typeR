library(miCoPTCM)


### Name: PTCMestimBF
### Title: Corrected score approach
### Aliases: PTCMestimBF PTCMestimBF.default PTCMestimBF.formula
###   print.PTCMestimBF summary.PTCMestimBF print.summary.PTCMestimBF

### ** Examples

library("survival")
## Data generation
set.seed(123)
n <- 200
varCov <- matrix(nrow=3,ncol=3,0)
varCov[2,2] <- 0.1^1
X1 <- (runif(n)-.5)/sqrt(1/12) 
V <- round(X1 + rnorm(n,rep(0,3),varCov[2,2]),7)# covariate with measurement error
Xc <- round(as.numeric(runif(n)<0.5),7) # covariate without measurement error

 # censoring times: truncated exponential distribution
C <- round(rexp(n,1/5),5) 
Cbin <- (C>30)
while(sum(Cbin)>0)
{
	C[Cbin] <- round(rexp(sum(Cbin),1/5),5)
	Cbin <- (C>30)
}

expb <- exp(0.5+X1-0.5*Xc) 
cure <- exp(-expb) # cure probabilities

 # event times with baseline cdf of a truncated exponential 
U <- runif(n)
d <- rep(NA,n)
T <- round(-6*log( 1+ (1-exp(-20/6))*log(1-(1-cure)*U)/expb ),5) 
T[(runif(n)<cure)] <- 99999 # cured subjects

Tobs <- rep(NA,n)
Tobs <- pmin(C,T) # observed times
Tmax <- max(Tobs[Tobs==T])
d <- (Tobs==T) # censoring indicator
	
Dat <- data.frame(Tobs,d,V,Xc)
#colnames(Dat) <- c("Tobs","d","V","Xc")


## Model estimation
fm <- formula(Surv(Tobs,d) ~ V + Xc)
resMY <- PTCMestimBF(fm, Dat, varCov=varCov, init=rnorm(3))
resMY
summary(resMY)



