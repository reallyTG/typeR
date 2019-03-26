library(SCRSELECT)


### Name: DICTAUG
### Title: Performs a grid search over the marginal posterior probabilities
###   of inclusion and returns a list of DIC values corresponding to each
###   grid point. This is used in the ReturnModel function.
### Aliases: DICTAUG

### ** Examples

####Randomly Generate Semicompeting Risks Data
####Generates random patient time, indicator and covariates.
set.seed(1)
n=100
Y1=runif(n,0,100)
I1=rbinom(n,1,.5)
Y2=Y1
I2=I1
for(i in 1:n){if(I1[i]==0){Y2[i]=Y1[i]}else{Y2[i]=Y1[i]+runif(1,0,100)}}
I2=rbinom(n,1,.5)
library(mvtnorm)
X=rmvnorm(n,rep(0,7),diag(7))
###Read in Posterior mean quantities from SCRSELECTRETURN
PCT1=c(.2,.4,.7,.8,.5)
PCT2=c(.02,.06,.1,.5,.7)
PCT3=c(.85,.87,.3,.45,.51)
gam=rgamma(n,1,1)
s1=c(0,3,5,max(Y1[I1==1]))
lam1=c(-1,-3,0)
s2=c(0,1,max(Y2[I1==0]))
lam2=c(0,-2)
s3=c(0,max(Y2[I1==1]))
lam3=-2
####Read in Hyperparameters
c=5
###Number of iterations and output location
B=4
###Number of variables to exclude from selection and burnin percent
inc=2
DICTAUG(PCT1,PCT2,PCT3,X,Y1,Y2,I1,I2,s1,lam1,s2,lam2,s3,lam3,gam,c,B,inc)



