library(crs)


### Name: wage1
### Title: Cross-Sectional Data on Wages
### Aliases: wage1
### Keywords: datasets

### ** Examples

## Not run: 
##D data(wage1)
##D 
##D ## Cross-validated model selection for spline degree and bandwidths Note
##D ## - we override the default nmulti here to get a quick illustration
##D ## (we don't advice doing this, in fact advise using more restarts in
##D ## serious applications)
##D 
##D model <- crs(lwage~married+
##D              female+
##D              nonwhite+                
##D              educ+
##D              exper+
##D              tenure,
##D              basis="additive",
##D              complexity="degree",
##D              data=wage1,
##D              segments=c(1,1,1),
##D              nmulti=1)
##D 
##D summary(model)
##D 
##D ## Residual plots
##D plot(model)
##D ## Partial mean plots (control for non axis predictors)
##D plot(model,mean=TRUE)
##D ## Partial first derivative plots (control for non axis predictors)
##D plot(model,deriv=1)
##D ## Partial second derivative plots (control for non axis predictors)
##D plot(model,deriv=2)
##D ## Compare with local linear kernel regression
##D require(np)
##D model <- npreg(lwage~married+
##D                female+
##D                nonwhite+                
##D                educ+
##D                exper+
##D                tenure,
##D                regtype="ll",
##D                bwmethod="cv.aic",
##D                data=wage1)
##D 
##D summary(model)
##D 
##D ## Partial mean plots (control for non axis predictors)
##D plot(model,common.scale=FALSE)
##D ## Partial first derivative plots (control for non axis predictors)
##D plot(model,gradients=TRUE,common.scale=FALSE)
##D detach("package:np")
## End(Not run)



