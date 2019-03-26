library(BTLLasso)


### Name: GLESsmall
### Title: Subset of the GLES data set with 200 observations and 4
###   covariates.
### Aliases: GLESsmall
### Keywords: datasets

### ** Examples


## Not run: 
##D op <- par(no.readonly = TRUE)
##D 
##D data(GLESsmall)
##D 
##D ## extract data and center covariates for better interpretability
##D Y <- GLESsmall$Y
##D X <- scale(GLESsmall$X, scale = FALSE)
##D Z1 <- scale(GLESsmall$Z1, scale = FALSE)
##D 
##D ## vector of subtitles, containing the coding of the X covariates
##D subs.X <- c('', 'female (1); male (0)')
##D 
##D ## Cross-validate BTLLasso model
##D m.gles.cv <- cv.BTLLasso(Y = Y, X = X, Z1 = Z1)
##D m.gles.cv
##D 
##D coef(m.gles.cv)
##D logLik(m.gles.cv)
##D 
##D head(predict(m.gles.cv, type="response"))
##D head(predict(m.gles.cv, type="trait"))
##D 
##D par(xpd = TRUE, mar = c(5,4,4,6))
##D plot(m.gles.cv, subs.X = subs.X, plots_per_page = 4, which = 2:5)
##D paths(m.gles.cv, y.axis = 'L2')
##D 
##D par(op)
## End(Not run)




