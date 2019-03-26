library(condmixt)


### Name: condmixt.dirac.negloglike
### Title: Negative log-likelihood for conditional mixture with a discrete
###   component at zero.
### Aliases: condmixt.dirac.negloglike condhparetomixt.dirac.negloglike
###   condlognormixt.dirac.negloglike condgaussmixt.dirac.negloglike
###   condbergamixt.negloglike

### ** Examples

# generate train data with a mass at zero
ntrain <- 200
xtrain <- runif(ntrain,0,2*pi)
alpha.train <- sin(2*xtrain)/2+1/2
data.train <- rep(0,ntrain)
for (i in 1:ntrain){
  if (sample(c(0,1),1,prob=c(1-alpha.train[i],alpha.train[i]))){
   # rainy day, sample from a Frechet
    data.train[i] <-rfrechet(1,loc=3*sin(2*xtrain[i])+4,scale=1/(1+exp(-(xtrain[i]-1))),
                    shape=(1+exp(-(xtrain[i]/5-2))))
  }
}

plot(xtrain,data.train,pch=20)


h <- 4 # number of hidden units
m <- 2 # number of components

# initialize a conditional mixture with hybrid Pareto components and a
# dirac at zero
 thetainit <- condhparetomixt.dirac.init(1,h,m,data.train)

# compute mixture parameters 
params.mixt <- condhparetomixt.dirac.fwd(thetainit,h,m,t(xtrain))

# compute negative log-likelihood 
nll <- condhparetomixt.dirac.negloglike(params.mixt, m, data.train)




