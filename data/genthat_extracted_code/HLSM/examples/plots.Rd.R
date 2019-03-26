library(HLSM)


### Name: plotDiagnostic
### Title: built-in plot functions for HLSM object
### Aliases: plotDiagnostic plotLikelihood plotHLSM.random.fit
###   plotHLSM.fixed.fit plotHLSM.LS

### ** Examples

#using advice seeking network of teachers in 15 schools
#to fit the data

#Random effect model#
priors = NULL
tune = NULL
initialVals = NULL
niter = 10

random.fit = HLSMrandomEF(Y = ps.advice.mat,FullX = ps.edge.vars.mat,
	initialVals = initialVals,priors = priors,
	tune = tune,tuneIn = FALSE,dd = 2,niter = niter,
	intervention = 0)

plotLikelihood(random.fit)

intercept = getIntercept(random.fit)
dim(intercept) ##is an array of dimension niter by 15
plotDiagnostic(intercept[,1])
plotHLSM.LS(random.fit)
plotHLSM.random.fit(random.fit,parameter = 'Beta')
plotHLSM.random.fit(random.fit,parameter = 'Intercept')
##look at the diagnostic plot of intercept for the first school





