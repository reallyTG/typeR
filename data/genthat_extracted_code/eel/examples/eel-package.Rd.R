library(eel)


### Name: eel-package
### Title: Extended Empirical Likelihood
### Aliases: eel-package
### Keywords: Empirical Likelihood

### ** Examples

# EXAMPLE: computing the EEL for the mean of a bivariate random variable
# Generating a sample of n=40 bivariate observations. 
# For this example, we do this through a univariate normal random number generator.

uninorm<- rnorm(40*2,5,1)                          
multnorm<-matrix(uninorm,ncol=2)

# To calculate the EEL for a point theta=c(5,2), use
EEL(x=multnorm,theta=c(5,2))

# an example to use the EEL_est in the case of estimating equation

# generate regression dataset
# random variable x
dmx2<-runif(100,min=0,max=100)
dmx<-matrix(0,100,2)
dmx[,1]=1
dmx[,2]=dmx2

# set the initial beta value
beta0<-c(1,2)  

# generate random errors and calculate the response variable
errdata<-rnorm(100,0,1)
ydata<-dmx%*%beta0+errdata 

# calculate the maximum empirical likelihood estimates
beta_lse<-solve(t(dmx)%*%dmx)%*%(t(dmx)%*%ydata)

num=EEL_est(x=dmx,theta=c(1,2),theta_tilda=beta_lse,
"gx<-matrix(0,nrow=100,ncol=2) 
for(i in 1:2){gx[,i]<-dmx[,i]*(ydata-dmx%*%as.matrix(theta))} 
gx")
summary(num)



