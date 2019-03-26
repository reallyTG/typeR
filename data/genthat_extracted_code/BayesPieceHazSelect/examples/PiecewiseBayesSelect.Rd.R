library(BayesPieceHazSelect)


### Name: PiecewiseBayesSelect
### Title: PiecewiseBayesSelect
### Aliases: PiecewiseBayesSelect

### ** Examples

##Randomly Generate Semicompeting Risks Data
####Generates random patient time, indicator and covariates.
n=100
Y1=runif(n,0,100)
I1=rbinom(n,1,.5)
library(mvtnorm)
X=rmvnorm(n,rep(0,13),diag(13))
####Read in Hyperparameters
##Swap Rate
psi=.5
c=20
###Eta Beta function probabilities
z1a=.4
z1b=1.6
####Hierarchical lam params
###Sigma^2 lambda_ hyperparameters
a1=.7
b1=.7
##Spacing dependence c in [0,1]
clam1=1
#####NumSplit
alpha1=3
J1max=10
####Split Point Starting Value ###
J1=3
##Tuning parameter for lambda
cl1=.25
###Beta Starting Values
beta1start=c(0,0,-1,0,0,0,1,1,1,1,1,-1,-1)
hyper=c(psi,c,z1a,z1b,a1,b1,clam1,alpha1,J1max,J1,cl1)
###Number of iterations and output location
B=200
Path=tempdir()
inc=2
burn=.4
PiecewiseBayesSelect(Y1,I1,X,hyper,beta1start,B,inc,Path,burn)



