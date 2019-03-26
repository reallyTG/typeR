library(BHMSMAfMRI)


### Name: glmcoeff
### Title: Fit GLM to the data time-series and obtain GLM coefficients
###   along with standard error estimates
### Aliases: glmcoeff

### ** Examples

nsubject <- 3
grid <- 8
Data <- array(dim=c(3,8,8,10),rnorm(3*8*8*10))
DesignMatrix <- cbind( c(rep(c(1,0),5)), rep(1,10) )
glm.fit <- glmcoeff(nsubject, grid, Data, DesignMatrix)
dim(glm.fit$GLMCoeffStandardized)
#[1] 3 8 8



