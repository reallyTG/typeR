library(ChoiceModelR)


### Name: sharedatar
### Title: Arificial (Simulated) Fractional Choice Data for choicemodelr
### Aliases: sharedatar
### Keywords: datasets

### ** Examples

data(sharedatar)
head(sharedatar)

#  sharedatar WAS CREATED USING THE FOLLOWING CODE.

if (0) {

# LOAD LIBRARIES REQUIRED TO CREATE THE SIMULATED DATA.  
# YOU MAY NEED TO INSTALL THESE PACKAGES.
library(MASS)
library(lattice)
library(Matrix)
library(bayesm)

set.seed(88)

# CREATE FUNCTION TO SIMULATE ARTIFICIAL MULTINOMIAL 
# FRACTIONAL CHOICE DATA BASED SIMULATED TRUE BETAS.

simmnlv3 = function(p,n,l,beta) 
{
#
#   p. rossi 2004
#   Modified by John Colias 2011
#
# Purpose: simulate from Fractional MNL (including X values)
#
# Arguments:
#   p is number of alternatives
#   n is number of obs
#   l is number of draws to construct the share
#   beta is true parm value
#
# Output:
#   list of X  (note: we include full set of intercepts and 2 unif(-1,1) X vars)
#   y  (indicator of choice-- 1, ...,p
#   prob is a n x p matrix of choice probs
#
#   note: first choice alternative has intercept set to zero
#
k=length(beta)
x1=runif(n*p,min=-1,max=1)
x2=runif(n*p,min=-1,max=1)
x3=runif(n*p,min=-1,max=1)
I2=diag(rep(1,p-1))
zero=rep(0,p-1)
xadd=rbind(zero,I2)
for(i in 2:n) {
        xadd=rbind(xadd,zero,I2)
}

xlast3 = cbind(x1,x2,x3)
xmax = apply(xlast3,1,max)
xcat = (xlast3 == xmax)*1
X=cbind(xadd,xcat)

# now construct probabilities
Xbeta=X%*%beta
p=nrow(Xbeta)/n
Xbeta=matrix(Xbeta,byrow=T,ncol=p)
Prob=exp(Xbeta)
iota=c(rep(1,p))
denom=Prob%*%iota
Prob=Prob/as.vector(denom)
# draw y
y=array(double(1),dim=c(n,p,l))
for (i in 1:n) 
        {
        for (l in 1:l) {
        yvec=rmultinom(1,1,Prob[i,])
        y[i,,l] = yvec
        }
        }
return(list(y=apply(y,c(1,2),mean),X=X,beta=beta,prob=Prob))
}

# DEFINE DIMENSIONS OF ARTIFICIAL DATA.

nunits = 300     # number of units
cnum = 50        # number of cards per unit
anum = 5         # number of alternatives per card
lnum = 50        # number of draws to construct the shares for each card

# CREATE SIGMA FOR MULTIVARIATE NORMAL DISTRIBUTION OF HETEROGENEITY.
sigma = 0.2*matrix(runif(49),7,7)
tsigma = t(sigma)
sigma[lower.tri(sigma)] = tsigma[lower.tri(tsigma)]
sigma = nearPD(sigma)$mat

# DEFINE MEANS FOR MULTIVARIATE NORMAL DISTRIBUTION OF HETEROGENEITY.
avgbeta = c(.5,-1.5,.9,1.0,-1, -0.5, 1.5)

# DRAW BETAS FOR EACH UNIT.
# LAST THREE BETAS ARE 3 LEVELS OF ONE ATTRIBUTE
# THAT IS NON-DECREASING IN VALUE.

betatemp = mvrnorm(n=nunits, avgbeta, sigma)
beta = betatemp[,1:5]
beta = cbind(beta,beta[,5]+exp(betatemp[,6]))
beta = cbind(beta,beta[,6]+exp(betatemp[,7]))
tbeta = cbind(beta[,1:4],0) - apply(cbind(beta[,1:4],0),1,mean)
beta[,1:4] = tbeta[,1:4]
tbeta = beta[,5:7] - apply(beta[,5:7],1,mean)
beta[,5:7] = tbeta

# CREATE MULTINOMIAL LOGIT y AND X FOR EACH UNIT ASSUMING beta IS "TRUE".
datah=NULL
for (i in 1:nunits) {
datah[[i]] = simmnlv3(anum,cnum,lnum,beta[i,])
}

sharedatar = NULL
for (i in 1:nunits) {
    if (i == 1) { 
        cat("Please wait ... this may take a few minutes.", fill = TRUE)
        cat("", fill = TRUE) }
    for (c in 1:cnum) {
        depvar = datah[[i]]$y[c,]
            for (a in 1:anum) {
            xx = datah[[i]]$X[(c-1)*anum+a,]
            xa = xx[1:(length(xx)-3)]%*%c(1:(length(xx)-3))
            if (sum(xa)==0) {xa = length(xx) - 2}
            xb = which.max(xx[(length(xx)-2):length(xx)])
            sharedatar = rbind(sharedatar,c(i,c,a,xa,xb,depvar[a])) } } }

# END OF CODE TO CREATE ARTIFICIAL DATA.
}




