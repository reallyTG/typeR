library(KoulMde)


### Name: Koul2StageMde
### Title: Two-stage minimum distance estimation in linear regression model
###   with autoregressive error.
### Aliases: Koul2StageMde

### ** Examples

####################
n <- 10
p <- 3
X <- matrix(runif(n*p, 0,50), nrow=n, ncol=p)  #### Generate n-by-p design matrix X
beta <- c(-2, 0.3, 1.5)                        #### Generate true beta = (-2, 0.3, 1.5)'
rho  <- 0.4                                    #### True rho = 0.4
eps <- vector(length=n)
xi <- rnorm(n, 0,1)                            #### Generate innovation from N(0,1)
                                              #### Generate autoregressive process of order 1
for(i in 1:n){
 if(i==1){eps[i] <- xi[i]}
 else{eps[i] <- rho*eps[i-1] + xi[i]}
}
Y <- X%*%beta + eps
#####################
D <- "default"                                  #### Use the default weight matrix
b0 <- solve(t(X)%*%X)%*%(t(X)%*%Y)              #### Set initial value for beta

IntMeasure <- "Lebesgue"                                ##### Define Lebesgue measure
MDEResult <- Koul2StageMde(Y,X, "default", b0, IntMeasure, 1, IntMeasure, TuningConst = 1.345)
MDE1stageResult <- MDEResult[[1]]
MDE2stageResult <- MDEResult[[2]]

beta1 <- MDE1stageResult$betahat1stage
residual1 <- MDE1stageResult$residual1stage
rho1 <- MDE1stageResult$rhohat1stage

beta2 <- MDE2stageResult$betahat2stage
residual2 <- MDE1stageResult$residual2stage
rho2 <- MDE2stageResult$rhohat2stage



