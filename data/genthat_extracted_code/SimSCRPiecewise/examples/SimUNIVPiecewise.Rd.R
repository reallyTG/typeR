library(SimSCRPiecewise)


### Name: SimUNIVPiecewise
### Title: SimUnivPiecewise
### Aliases: SimUNIVPiecewise

### ** Examples

##Set number of patients and covariate matrices
n=100
x1=matrix(rnorm(n*10,0,1),nrow=n)
##Sets up true covariate vector
beta1=rnorm(10,0,1)
##Sets up true baseline hazard split locations
s1=c(0,7,30,100,1000)
##Sets up baseline hazard heights
lam1=c(.1,.1,.3,.1,.1)
##Runs Function and returns a list of simulated data
X=SimUNIVPiecewise(x1,beta1,s1,lam1,1000)
X




