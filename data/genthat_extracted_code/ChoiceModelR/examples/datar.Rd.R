library(ChoiceModelR)


### Name: datar
### Title: Arificial (Simulated) Choice Data for choicemodelr
### Aliases: datar
### Keywords: datasets

### ** Examples

data(datar)
head(datar)

# datar DATA SET WAS CREATED USING THE FOLLOWING CODE.

if (0) {

# LOAD LIBRARIES REQUIRED TO CREATE THE SIMULATED DATA.  YOU MAY NEED TO INSTALL THESE PACKAGES.
library(MASS)
library(lattice)
library(Matrix)
library(bayesm)

set.seed(88)

# CREATE FUNCTION TO SIMULATE ARTIFICIAL MULTINOMIAL CHOICE DATA BASED SIMULATED TRUE BETAS.

simmnlv2 = function(p,n,beta) 
{
#
#   p. rossi 2004
#   Modified by John Colias 2011
#
# Purpose: simulate from MNL (including X values)
#
# Arguments:
#   p is number of alternatives
#   n is number of obs
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
Xbeta=matrix(Xbeta,byrow=TRUE,ncol=p)
Prob=exp(Xbeta)
iota=c(rep(1,p))
denom=Prob%*%iota
Prob=Prob/as.vector(denom)
# draw y
y=vector("double",n)
ind=1:p
for (i in 1:n) 
        {
        yvec=rmultinom(1,1,Prob[i,])
        y[i]=ind%*%yvec
        }

return(list(y=y,X=X,beta=beta,prob=Prob))
}

# DEFINE DIMENSIONS OF ARTIFICIAL DATA.

nunits = 300     # number of units
cmax = 50        # maximum number of cards per unit
amax = 5         # maximum number of alternatives per card

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
datah[[i]] = simmnlv2(amax,cmax,beta[i,])
}

# SAMPLE cmax-2, cmax-1, or cmax CARDS 
# FOR EACH UNIT TO CREATE DATA WITH VARYING 
# NUMBER OF CHOICE CARDS PER UNIT.
# SAMPLE amax-2, amax-1, or amax ALTERNATIVES
# FOR EACH CHOICE CARD OF EACH UNIT 
# TO CREATE DATA WITH VARYING NUMBER OF 
# ALTERNATIVES PER CHOICE CARD.
ny = NULL
datar = NULL
for (i in 1:nunits) {
      if (i == 1) { 
         cat("Please wait ... this may take a few minutes.", fill = TRUE)
         cat("", fill = TRUE) }

# SAMPLE CHOICE CARDS.
cards = sample(c(1:cmax),sample(c(cmax-2,cmax-1,cmax),1))
cnum = 0
for (c in cards) {
    cnum = cnum + 1
    cond = 0
# KEEP SAMPLING ALTERNATIVES UNTIL THE CHOSEN ALTERNATIVE IS WITHIN THE SAMPLED ALTERNATIVES.
    while (cond==0) {
        alts = sample(c(1:amax),sample(c(amax-2,amax-1,amax),1))
        depvar = datah[[i]]$y[c]
        if (is.element(depvar,alts)) { 
            cond = 1
            depvar = sum((depvar==alts)*c(1:length(alts))) } }
    anum = 0
    for (a in alts) {
        anum = anum + 1
        if (anum > 1) {depvar = 0}
        xx = datah[[i]]$X[(c-1)*amax+a,]
        xa = xx[1:(length(xx)-3)]%*%c(1:(length(xx)-3))
        if (sum(xa)==0) {xa = length(xx) - 2}
        xb = which.max(xx[(length(xx)-2):length(xx)])
        datar = rbind(datar,c(i,cnum,anum,xa,xb,depvar)) } } }

truebetas = cbind(beta[,1:4],0-apply(beta[,1:4],1,sum),beta[,5:7])
colnames(truebetas) = c("A1B1", "A1B2", "A1B3", "A1B4", "A1B5", "A2B1", "A2B2", "A2B3")

# END OF CODE TO CREATE ARTIFICIAL DATA.
}




