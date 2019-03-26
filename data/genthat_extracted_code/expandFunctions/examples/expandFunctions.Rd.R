library(expandFunctions)


### Name: expandFunctions
### Title: expandFunctions: a feature matrix builder
### Aliases: expandFunctions expandFunctions-package

### ** Examples

## Not run: 
##D # Sunspot counts can be somewhat Gaussianized by the
##D # Freeman-Tukey transform.
##D x <- freemanTukey(sunspot.month)
##D par(mfrow=c(1,1)) # just in case multiplots were left over.
##D plot(x,type="l")
##D 
##D # Embed x using eLag
##D # Since the base period of sunspots is 11*12 months,
##D # pick the lags to be fractions of this.
##D myLags <- seq(from=0,to=200,by=1)
##D X <- eTrim(eLag(x,myLags))
##D Y <- X[,+1,drop=FALSE]
##D X <- X[,-1,drop=FALSE]
##D # matplot(X,type="l",lty=1)
##D 
##D # OLS fitting on the lag feature set
##D lmObj <- lm(y ~ .,data = data.frame(x=X,y=Y))
##D coefPlot(lmObj,type="b")
##D summary(lmObj)
##D Yhat <- predict(lmObj, newdata = data.frame(x=X))
##D Ydiagnostics(Y,Yhat)
##D 
##D # LASSO fitting on the lag feature set
##D lassoObj <- easyLASSO(X,Y,criterion="lambda.min")
##D coefPlot(lassoObj,type="b")
##D Yhat <- predict(lassoObj,newx = X)
##D Ydiagnostics(Y,Yhat)
##D 
##D # Reduce the lag feature set using non-zero
##D # LASSO coefficients
##D useCoef <- coef(lassoObj)[-1]!=0
##D myLags <- seq(from=0,to=200,by=1)[c(TRUE,useCoef)]
##D X <- eTrim(eLag(x,myLags))
##D Y <- X[,+1,drop=FALSE]
##D X <- X[,-1,drop=FALSE]
##D 
##D # OLS fitting on the reduced lag feature set
##D lmObj <- lm(y ~ .,data = data.frame(x=X,y=Y))
##D summary(lmObj)
##D coefPlot(lmObj)
##D Yhat <- predict(lmObj, newdata = data.frame(x=X))
##D Ydiagnostics(Y,Yhat)
##D 
##D # 1st nonlinear feature set
##D # Apply a few Chebyshev functions to the columns of the
##D # lag matrix. Note these exclude the constant values,
##D # but include the linear.
##D chebyFUN <- polywrapper(basePoly=orthopolynom::chebyshev.t.polynomials,
##D                         kMax=5)
##D Z <- eMatrixOuter(X,1:5,chebyFUN)
##D 
##D # OLS fitting on the 1st nonlinear feature set
##D lmObj <- lm(y ~ .,data = data.frame(z=Z,y=Y))
##D summary(lmObj)
##D Yhat <- predict(lmObj, newdata = data.frame(z=Z))
##D Ydiagnostics(Y,Yhat)
##D 
##D # LASSO fitting on the 1st nonlinear feature set
##D lassoObj <- easyLASSO(Z,Y)
##D coefPlot(lassoObj)
##D Yhat <- predict(lassoObj,newx = Z)
##D Ydiagnostics(Y,Yhat)
##D 
##D # 2nd nonlinear feature set
##D # Use eQuad as an alternative expansion of the lags
##D Z <- eQuad(X)
##D 
##D # OLS fitting on the 2nd nonlinear feature set
##D lmObj <- lm(y ~ .,data = data.frame(z=Z,y=Y))
##D summary(lmObj)
##D Yhat <- predict(lmObj, newdata = data.frame(z=Z))
##D Ydiagnostics(Y,Yhat)
##D 
##D # LASSO fitting on the 2nd nonlinear feature set
##D lassoObj <- easyLASSO(Z,Y)
##D coefPlot(lassoObj)
##D Yhat <- predict(lassoObj,newx = Z)
##D Ydiagnostics(Y,Yhat)
## End(Not run)




