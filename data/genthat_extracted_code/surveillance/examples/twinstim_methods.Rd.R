library(surveillance)


### Name: twinstim_methods
### Title: Print, Summary and Extraction Methods for '"twinstim"' Objects
### Aliases: print.twinstim summary.twinstim coeflist.twinstim
###   vcov.twinstim logLik.twinstim nobs.twinstim print.summary.twinstim
###   toLatex.summary.twinstim xtable.twinstim xtable.summary.twinstim
### Keywords: methods print htest

### ** Examples

# load a fit of the 'imdepi' data, see the example in ?twinstim
data("imdepifit")

# print method
imdepifit

# extract point estimates (in a single vector or listed by model component)
coef(imdepifit)
coeflist(imdepifit)

# variance-covariance matrix of endemic parameters
# (inverse of expected Fisher information)
unname(vcov(imdepifit)[1:4,1:4])

# the default confint() method may be used for Wald CI's
confint(imdepifit, parm="e.typeC", level=0.95)

# log-likelihood and AIC of the fitted model
logLik(imdepifit)
AIC(imdepifit)
nobs(imdepifit)

# produce a summary with parameter correlations and runtime information
(s <- summary(imdepifit, correlation=TRUE, symbolic.cor=TRUE, runtime=TRUE))

# create LaTeX code of coefficient table
toLatex(s, withAIC=FALSE)

# or using the xtable-method (which produces rate ratios)
xtable(s)



