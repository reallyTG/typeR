library(genridge)


### Name: ridge
### Title: Ridge Regression Estimates
### Aliases: ridge ridge.default ridge.formula coef.ridge print.ridge
###   vcov.ridge
### Keywords: models regression

### ** Examples


#\donttest{
# Longley data, using number Employed as response
longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)

# same, using formula interface
lridge <- ridge(Employed ~ GNP + Unemployed + Armed.Forces + Population + Year + GNP.deflator, 
		data=longley, lambda=lambda)


coef(lridge)
traceplot(lridge)
traceplot(lridge, X="df")
pairs(lridge, radius=0.5)
#}

## No test: 
if (require("ElemStatLearn")) {
	py <- prostate[, "lpsa"]
	pX <- data.matrix(prostate[, 1:8])
	pridge <- ridge(py, pX, df=8:1)
	pridge
	
	plot(pridge)
	pairs(pridge)
	traceplot(pridge)
	traceplot(pridge, X="df")
}
## End(No test)

# Hospital manpower data from Table 3.8 of Myers (1990) 
data(Manpower)
str(Manpower)

mmod <- lm(Hours ~ ., data=Manpower)
vif(mmod)
# ridge regression models, specified in terms of equivalent df
mridge <- ridge(Hours ~ ., data=Manpower, df=seq(5, 3.75, -.25))
vif(mridge)

# univariate ridge trace plots
traceplot(mridge)
traceplot(mridge, X="df")

## No test: 
# bivariate ridge trace plots
plot(mridge, radius=0.25, labels=mridge$df)
pairs(mridge, radius=0.25)

# 3D views
# ellipsoids for Load, Xray & BedDays are nearly 2D
plot3d(mridge, radius=0.2, labels=mridge$df)
# variables in model selected by AIC & BIC
plot3d(mridge, variables=c(2,3,5), radius=0.2, labels=mridge$df)

# plots in PCA/SVD space
mpridge <- pca.ridge(mridge)
traceplot(mpridge, X="df")
biplot(mpridge, radius=0.25)
## End(No test)




