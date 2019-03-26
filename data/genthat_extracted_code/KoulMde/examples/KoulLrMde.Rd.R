library(KoulMde)


### Name: KoulLrMde
### Title: Minimum distance estimation in linear regression model.
### Aliases: KoulLrMde

### ** Examples

####################
n <- 10
p <- 3
X <- matrix(runif(n*p, 0,50), nrow=n, ncol=p)  #### Generate n-by-p design matrix X
beta <- c(-2, 0.3, 1.5)                        #### Generate true beta = (-2, 0.3, 1.5)'
eps <- rnorm(n, 0,1)                           #### Generate errors from N(0,1)
Y <- X%*%beta + eps

D <- "default"                                 #### Use the default weight matrix
b0 <- solve(t(X)%*%X)%*%(t(X)%*%Y)             #### Set initial value for beta
IntMeasure <- "Lebesgue"                       ##### Define Lebesgue measure


MDEResult <- KoulLrMde(Y,X,D, b0, IntMeasure, TuningConst=1.345)

betahat <- MDEResult$betahat                   ##### Obtain minimum distance estimator
resid <- MDEResult$residual                    ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function


IntMeasure <- "Degenerate"                     ##### Define degenerate measure at 0

MDEResult <- KoulLrMde(Y,X,D, b0, IntMeasure, TuningConst=1.345)
betahat <- MDEResult$betahat                   ##### Obtain minimum distance estimator
resid <- MDEResult$residual                    ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function



IntMeasure <- "Robust"                        ##### Define "Robust" measure
TuningConst <- 3                              ##### Define the tuning constant
MDEResult <- KoulLrMde(Y,X,D, b0, IntMeasure, TuningConst)


betahat <- MDEResult$betahat                   ##### Obtain minimum distance estimator
resid <- MDEResult$residual                    ##### Obtain residual
objVal <- MDEResult$ObjVal                     ##### Obtain the value of the objective function



