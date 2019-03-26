library(RMediation)


### Name: ci
### Title: CI for a nonlinear function of coefficients estimates
### Aliases: ci
### Keywords: distribution regression

### ** Examples

ci(mu=c(b1=1,b2=.7,b3=.6, b4= .45), Sigma=c(.05,0,0,0,.05,0,0,.03,0,.03), 
quant=~b1*b2*b3*b4, type="all", plot=TRUE, plotCI=TRUE)

#An Example of Conservative Null Sampling Distribution
ci(c(b1=.3,b2=.4,b3=.3), c(.01,0,0,.01,0,.02), 
quant=~b1*b2*b3, type="mc", plot=TRUE, plotCI=TRUE, 
H0=TRUE, mu0=c(b1=.3,b2=.4,b3=0)  )

#An Example of Less Conservative Null Sampling Distribution
ci(c(b1=.3,b2=.4,b3=.3), c(.01,0,0,.01,0,.02),
quant=~b1*b2*b3, type="mc", plot=TRUE, plotCI=TRUE, 
H0=TRUE, mu0=c(b1=0,b2=.4,b3=0.1)  )



