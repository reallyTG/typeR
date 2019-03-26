library(rdd)


### Name: RDestimate
### Title: Regression Discontinuity Estimation
### Aliases: RDestimate

### ** Examples

x<-runif(1000,-1,1)
cov<-rnorm(1000)
y<-3+2*x+3*cov+10*(x>=0)+rnorm(1000)
RDestimate(y~x)
# Efficiency gains can be made by including covariates
RDestimate(y~x|cov)



