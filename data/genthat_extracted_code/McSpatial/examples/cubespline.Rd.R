library(McSpatial)


### Name: cubespline
### Title: Smooth cubic spline estimation
### Aliases: cubespline
### Keywords: Parmametric Models Series Expansions

### ** Examples

data(cookdata)
fardata <- cookdata[!is.na(cookdata$LNFAR),]
par(ask=TRUE)

# single variable
o <- order(fardata$DCBD)
fit1 <- cubespline(LNFAR~DCBD, mink=1, maxk=10,data=fardata)
c(fit1$rss, fit1$sig2, fit1$aic, fit1$sc, fit1$gcv, fit1$knots)
plot(fardata$DCBD[o], fardata$LNFAR[o], xlab="Distance from CBD", ylab="Log FAR")
lines(fardata$DCBD[o], fit1$splinehat[o], col="red")

# multiple explanatory variables
fit2 <- cubespline(fardata$LNFAR~fardata$DCBD+fardata$AGE,  mink=1, maxk=10)
c(fit2$rss, fit2$sig2, fit2$aic, fit2$sc, fit2$gcv, fit2$knots)
plot(fardata$DCBD[o], fardata$LNFAR[o], xlab="Distance from CBD", ylab="Log FAR")
lines(fardata$DCBD[o], fit2$splinehat[o], col="red")

# pre-specified number of knots
fit3 <- cubespline(LNFAR~DCBD+AGE,  knots=4, data=fardata)




