library(HLSM)


### Name: HLSMrandomEF
### Title: Function to run the MCMC sampler in random effects model (and
###   HLSMfixedEF for fixed effects model)
### Aliases: HLSMrandomEF HLSMfixedEF print.HLSM print.summary.HLSM
###   summary.HLSM getIntercept getAlpha getLS getLikelihood getBeta

### ** Examples


library(HLSM)

#Set values for the inputs of the function
priors = NULL
tune = NULL
initialVals = NULL
niter = 10

#Random effect HLSM on Pitt and Spillane data
random.fit = HLSMrandomEF(Y = ps.advice.mat,FullX = ps.edge.vars.mat,
	initialVals = initialVals,priors = priors,
	tune = tune,tuneIn = FALSE,dd = 2,niter = niter,
	intervention = 0)


summary(random.fit)
names(random.fit)

#extract results without burning and thinning
Beta = getBeta(random.fit)
Intercept = getIntercept(random.fit)
LS = getLS(random.fit)
Likelihood = getLikelihood(random.fit)

##Same can be done for fixed effect model

#Fixed effect HLSM on Pitt and Spillane data 

fixed.fit = HLSMfixedEF(Y = ps.advice.mat,FullX = ps.edge.vars.mat,
	initialVals = initialVals,priors = priors,
	tune = tune,tuneIn = FALSE,dd = 2,niter = niter,
	intervention = 0)

summary(fixed.fit)
names(fixed.fit)




