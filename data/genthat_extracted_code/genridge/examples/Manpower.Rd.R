library(genridge)


### Name: Manpower
### Title: Hospital manpower data
### Aliases: Manpower
### Keywords: datasets

### ** Examples

data(Manpower)
mmod <- lm(Hours ~ ., data=Manpower)
vif(mmod)
# ridge regression models, specified in terms of equivalent df
mridge <- ridge(Hours ~ ., data=Manpower, df=seq(5, 3.75, -.25))
vif(mridge)

# univariate ridge trace plots
traceplot(mridge)
traceplot(mridge, X="df")

# bivariate ridge trace plots
plot(mridge, radius=0.25, labels=mridge$df)
pairs(mridge, radius=0.25)

## No test: 
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




