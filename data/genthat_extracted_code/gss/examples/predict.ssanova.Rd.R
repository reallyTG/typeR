library(gss)


### Name: predict.ssanova
### Title: Predicting from Smoothing Spline ANOVA Fits
### Aliases: predict.ssanova predict.ssanova0 predict1 predict1.ssanova
### Keywords: models regression smooth

### ** Examples

## THE FOLLOWING EXAMPLE IS TIME-CONSUMING
## Not run: 
##D ## Fit a model with cubic and thin-plate marginals, where geog is 2-D
##D data(LakeAcidity)
##D fit <- ssanova(ph~log(cal)*geog,,LakeAcidity)
##D ## Obtain estimates and standard errors on a grid
##D new <- data.frame(cal=1,geog=I(matrix(0,1,2)))
##D new <- model.frame(~log(cal)+geog,new)
##D predict(fit,new,se=TRUE)
##D ## Evaluate the geog main effect
##D predict(fit,new,se=TRUE,inc="geog")
##D ## Evaluate the sum of the geog main effect and the interaction
##D predict(fit,new,se=TRUE,inc=c("geog","log(cal):geog"))
##D ## Evaluate the geog main effect on a grid
##D grid <- seq(-.04,.04,len=21)
##D new <- model.frame(~geog,list(geog=cbind(rep(grid,21),rep(grid,rep(21,21)))))
##D est <- predict(fit,new,se=TRUE,inc="geog")
##D ## Plot the fit and standard error
##D par(pty="s")
##D contour(grid,grid,matrix(est$fit,21,21),col=1)
##D contour(grid,grid,matrix(est$se,21,21),add=TRUE,col=2)
##D ## Clean up
##D rm(LakeAcidity,fit,new,grid,est)
##D dev.off()
## End(Not run)



