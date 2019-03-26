library(SimSCRPiecewise)


### Name: SimSCRPiecewise
### Title: SimSCRPiecewise
### Aliases: SimSCRPiecewise

### ** Examples

##Set number of patients and covariate matrices
n=100
x1=matrix(rnorm(n*10,0,1),nrow=n)
x2=x1
x3=x1
##Sets up true covariate vectors
beta1=rnorm(10,0,1)
beta2=rnorm(10,0,1)
beta3=c(3,rep(0,9))
##Sets up three baseline hazard split locations
s1=c(0,7,30,100,1000)
s2=c(0,50,100,2000)
s3=c(0,10,40,50,500)
##Sets up baseline hazard heights
lam1=c(.1,.1,.3,.1,.1)
lam2=c(.2,.3,.1,.1)
lam3=c(.1,.3,.2,.2,.1)
gamma=rgamma(100,1,1)
##Runs Function and returns a list of simulated data
X=SimSCRPiecewise(x1,x2,x3,beta1,beta2,beta3,s1,s2,s3,lam1,lam2,lam3,gamma,1000)
X




