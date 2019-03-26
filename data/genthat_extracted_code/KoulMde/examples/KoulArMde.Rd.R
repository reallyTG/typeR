library(KoulMde)


### Name: KoulArMde
### Title: Minimum distance estimation in the autoregression model of the
###   known order.
### Aliases: KoulArMde

### ** Examples

##### Generate stationary AR(2) process with 10 observations
n <- 10
q <- 2
rho <- c(-0.2, 0.8)    ##### Generate true parameters rho = (-0.2, 0.8)'
eps <- rnorm(n, 0,1)   ##### Generate innovations from N(0,1)
X <- rep(0, times=n)
for (i in 1:n){
 tempCol <- rep(0, times=q)
 for (j in 1:q){
   if(i-j<=0){
     tempCol[j] <- 0
   }else{
     tempCol[j] <- X[i-j]
   }
 }
X[i] <- t(tempCol)%*% rho + eps[i]
}

IntMeasure <- "Lebesgue"                       ##### Define Lebesgue measure

MDEResult <- KoulArMde(X, q, IntMeasure, TuningConst=1.345)
rhohat <- MDEResult$rhohat                     ##### Obtain minimum distance estimator
resid  <- MDEResult$residual                   ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function


IntMeasure <- "Degenerate"                     ##### Define degenerate measure at 0
MDEResult <- KoulArMde(X, q, IntMeasure, TuningConst=1.345)
rhohat <- MDEResult$rhohat                     ##### Obtain minimum distance estimator
resid <- MDEResult$residual                    ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function


IntMeasure <- "Robust"                         ##### Define "Robust" measure at 0
TuningConst <- 3                               ##### Define the tuning constant
MDEResult <- KoulArMde(X, q, IntMeasure, TuningConst)

resid <- MDEResult$residual                    ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function




