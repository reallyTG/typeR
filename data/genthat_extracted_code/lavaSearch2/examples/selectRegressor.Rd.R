library(lavaSearch2)


### Name: selectRegressor
### Title: Regressor of a Formula.
### Aliases: selectRegressor selectRegressor.formula
### Keywords: internal

### ** Examples


## Not run: 
##D 
##D selectRegressor <- lavaSearch2:::selectRegressor
##D selectRegressor.formula <- lavaSearch2:::selectRegressor.formula
##D 
##D selectRegressor(Y1~X1+X2)
##D selectRegressor(Y1~X1+X2, format = "vars")
##D 
##D selectRegressor(Y1~X1+Y1)
##D selectRegressor(Y1+Y2~X1+Y1, format = "vars")
##D 
##D selectRegressor(~X1+X2)
##D selectRegressor(~X1+X2, format = "vars")
##D 
## End(Not run)



