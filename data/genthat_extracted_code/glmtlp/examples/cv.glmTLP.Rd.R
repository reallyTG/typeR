library(glmtlp)


### Name: cv.glmTLP
### Title: Cross-validation for glmTLP
### Aliases: cv.glmTLP
### Keywords: models regression

### ** Examples

	data("QuickStartExample")
	fit = cv.glmTLP(x,y,tau = 1,nfolds = 2, lambda = c(0.1,05)) 
	#We set nflods and lambda just to speed it up 
	# and pass the CRAN check. You should either use
	# the default setting or search a larger space.



