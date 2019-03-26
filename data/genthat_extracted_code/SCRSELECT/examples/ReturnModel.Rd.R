library(SCRSELECT)


### Name: ReturnModel
### Title: Performs the DIC-tau_g procedure and returns the posterior
###   quantities of the optimal model.
### Aliases: ReturnModel

### ** Examples

####Randomly Generate Semicompeting Risks Data
set.seed(1)
####Generates random patient time, indicator and covariates.
n=100
Y1=runif(n,0,100)
I1=rbinom(n,1,.5)
Y2=Y1
I2=I1
for(i in 1:n){if(I1[i]==0){Y2[i]=Y1[i]}else{Y2[i]=Y1[i]+runif(1,0,100)}}
I2=rbinom(n,1,.5)
library(mvtnorm)
X=rmvnorm(n,rep(0,7),diag(7))
####Read in Hyperparameters
##Swap Rate
psi=.5
c=5
###Eta Beta function probabilities
z1a=.4
z1b=1.6
z2a=.4
z2b=1.6
z3a=.4
z3b=1.6
####Hierarchical lam params
###Sigma^2 lambda_g hyperparameters
a1=.7
b1=.7
a2=a1
b2=b1
a3=a1
b3=b1
##Spacing dependence c in [0,1]
clam1=1
clam2=1
clam3=1
#####NumSplit
alpha1=3
alpha2=3
alpha3=3
J1max=10
J2max=10
J3max=10
####Split Point Starting Value ###
J1=3
J2=3
J3=3
###epsilon starting values/hyperparameters###
w=.7
psi1=.7
cep=2.4
#############
epstart=1.5
cl1=.25
cl2=.25
cl3=.25
###Beta Starting Values
hyper1=c(psi,c,z1a,z1b,z2a,z2b,z3a,z3b,a1,b1,a2,b2,a3,b3,clam1,clam2,clam3)
hyper2=c(alpha1,alpha2,alpha3,J1max,J2max,J3max,J1,J2,J3,w,psi1,cep,epstart,cl1,cl2,cl3)
hyper=c(hyper1,hyper2)
###Number of iterations and output location
BSVSS=10
BDIC=4
Path=tempdir()
###Number of variables to exclude from selection and burnin percent
inc=2
ReturnModel(Y1,I1,Y2,I2,X,hyper,inc,c,BSVSS,BDIC,Path)



