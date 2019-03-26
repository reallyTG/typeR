library(boxcoxmix)


### Name: Kfind.boxcox
### Title: Grid search over K for NPML estimation of random effect and
###   variance component models
### Aliases: Kfind.boxcox
### Keywords: Kfind boxcox

### ** Examples

# Fabric data
## No test: 
data(fabric, package = "npmlreg")
teststr<-Kfind.boxcox(y ~ x, data = fabric,  start = "gq", groups=1, 
find.k = c(2, 3), model.selection = "aic", steps.tol=5)
# Minimal AIC: 202.2114 at K= 2 
## End(No test)












