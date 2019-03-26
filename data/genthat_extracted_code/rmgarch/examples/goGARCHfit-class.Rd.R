library(rmgarch)


### Name: goGARCHfit-class
### Title: class: GO-GARCH Fit Class
### Aliases: goGARCHfit-class as.matrix,goGARCHfit-method
###   coef,goGARCHfit-method convolution,goGARCHfit-method convolution
###   fitted,goGARCHfit-method residuals,goGARCHfit-method
###   likelihood,goGARCHfit-method nisurface,goGARCHfit-method nisurface
###   gportmoments,goGARCHfit-method gportmoments rcor,goGARCHfit-method
###   rcor rcoskew,goGARCHfit-method rcoskew rcokurt,goGARCHfit-method
###   rcokurt rcov,goGARCHfit-method rcov betacovar
###   betacovar,goGARCHfit-method betacoskew betacoskew,goGARCHfit-method
###   betacokurt betacokurt,goGARCHfit-method show,goGARCHfit-method
### Keywords: classes

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = gogarchspec(mean.model = list(demean = "constant"),
##D variance.model = list(model = "sGARCH", garchOrder = c(1,1), submodel = NULL),
##D distribution.model = list(distribution = "manig"), ica = "fastica")
##D fit = gogarchfit(spec = spec, data  = dji30ret[,1:4, drop = FALSE],
##D out.sample = 50, gfun = "tanh")
##D # The likelihood of the model
##D likelihood(fit)
##D # the GARCH coefficients of the independent factors
##D coef(fit)
##D # a news-impact surface plot
##D #ni = nisurface(fit, type = "cov", pair = c(1, 2), factor = c(1,2), plot = TRUE)
##D # the time varying correlation array
##D mc = rcor(fit)
##D # plot(mc[1,2,], type = "l")
##D # The moments of an equally weighted portfolio (subtract the out.sample from dimension)
##D gm = gportmoments(fit, weights = matrix(1/4, ncol = 4,
##D nrow = dim(dji30ret)[1]-50), debug = TRUE)
## End(Not run)


