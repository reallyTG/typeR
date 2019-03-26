library(genridge)


### Name: Detroit
### Title: Detroit Homicide Data for 1961-1973
### Aliases: Detroit
### Keywords: datasets

### ** Examples

data(Detroit)

# Work with a subset of predictors, from Miller (2002, Table 3.14),
# the "best" 6 variable model
#    Variables: Police, Unemp, GunLic, HClear, WhMale, WkEarn
# Scale these for comparison with other methods

Det <- as.data.frame(scale(Detroit[,c(1,2,4,6,7,11)]))
Det <- cbind(Det, Homicide=Detroit[,"Homicide"])

# use the formula interface; specify ridge constants in terms
# of equivalent degrees of freedom
dridge <- ridge(Homicide~., data=Det, df=seq(6,4,-.5))

# univariate trace plots are seemingly paradoxical in that
# some coefficients "shrink" *away* from 0
traceplot(dridge, X="df")
vif(dridge)
pairs(dridge, radius=0.5)

## No test: 
plot3d(dridge, radius=0.5, labels=dridge$df)

# transform to PCA/SVD space
dpridge <- pca.ridge(dridge)
# not so paradoxical in PCA space
traceplot(dpridge, X="df")
biplot(dpridge, radius=0.5, labels=dpridge$df)

# show PCA vectors in variable space
biplot(dridge, radius=0.5, labels=dridge$df)
## End(No test)




