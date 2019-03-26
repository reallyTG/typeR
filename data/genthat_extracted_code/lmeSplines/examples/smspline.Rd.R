library(lmeSplines)


### Name: smspline
### Title: Smoothing splines in NLME
### Aliases: smspline smspline.v
### Keywords: smooth models regression

### ** Examples

# smoothing spline curve fit
data(smSplineEx1)
# variable `all' for top level grouping
smSplineEx1$all <- rep(1,nrow(smSplineEx1))
# setup spline Z-matrix
smSplineEx1$Zt <- smspline(~ time, data=smSplineEx1)
fit1s <- lme(y ~ time, data=smSplineEx1,
    random=list(all=pdIdent(~Zt - 1)))
summary(fit1s)
plot(smSplineEx1$time,smSplineEx1$y,pch="o",type="n",
     main="Spline fits: lme(y ~ time, random=list(all=pdIdent(~Zt-1)))",
     xlab="time",ylab="y")
points(smSplineEx1$time,smSplineEx1$y,col=1)
lines(smSplineEx1$time, smSplineEx1$y.true,col=1)
lines(smSplineEx1$time, fitted(fit1s),col=2)

# fit model with cut down number of spline points
times20 <- seq(1,100,length=20)
Zt20 <- smspline(times20)
smSplineEx1$Zt20 <- approx.Z(Zt20,times20,smSplineEx1$time)
fit1s20 <- lme(y ~ time, data=smSplineEx1,
    random=list(all=pdIdent(~Zt20 - 1)))
# note: virtually identical df, loglik.
anova(fit1s,fit1s20)
summary(fit1s20)

# model predictions on a finer grid
times200 <- seq(1,100,by=0.5)
pred.df <- data.frame(all=rep(1,length(times200)),time=times200)
pred.df$Zt20 <- approx.Z(Zt20, times20,times200)
yp20.200 <- predict(fit1s20,newdata=pred.df)
lines(times200,yp20.200+0.02,col=4)


# mixed model spline terms at multiple levels of grouping
data(Spruce)
Spruce$Zday <- smspline(~ days, data=Spruce)
Spruce$all <- rep(1,nrow(Spruce))
# overall spline term, random plot and Tree effects
spruce.fit1 <- lme(logSize ~ days, data=Spruce,
                   random=list(all= pdIdent(~Zday -1),
                     plot=~1, Tree=~1))
# try overall spline term plus plot level linear + spline term
spruce.fit2 <- lme(logSize ~ days, data=Spruce,
                   random=list(all= pdIdent(~Zday - 1),
                     plot= pdBlocked(list(~ days,pdIdent(~Zday - 1))),
                     Tree = ~1))
anova(spruce.fit1,spruce.fit2)
summary(spruce.fit1)



