library(McSpatial)


### Name: lwr
### Title: Locally Weighted Regression
### Aliases: lwr
### Keywords: Locally Weighted Regression Nonparametric

### ** Examples

# 1. Monte Carlo data
n = 1000
x <- runif(n,0,2*pi)
x <- sort(x)
ybase <- x - .1*(x^2) + sin(x) - cos(x) -.5*sin(2*x) + .5*cos(2*x)
sig = sd(ybase)/2
y <- ybase + rnorm(n,0,sig)
par(ask=TRUE)
plot(x,y)
lines(x,ybase,col="red")
fit <- lwr(y~x, window=.15)
# plot 95% confidence intervals for predicted y 
predse <- sqrt(fit$sig2 + fit$yhat.se^2)
lower <- fit$yhat + qnorm(.025)*predse
upper <- fit$yhat + qnorm(.975)*predse
plot(x, ybase, type="l", ylim=c(min(lower), max(upper)), 
  main="Estimated Function", xlab="x", ylab="y")
lines(x, fit$yhat, col="red")
lines(x, lower, lty="dashed", col="red")
lines(x, upper, lty="dashed", col="red")
legend("topleft", c("Base", "Predicted", "95 Percent CI"), 
 col=c("black", "red", "red"), lty=c("solid", "solid", "dashed"), lwd=1)

# plot 95%  confidence intervals for slopes
dxbase <- 1 - .2*x + cos(x) + sin(x) - cos(2*x) - sin(2*x)
lower <- fit$dhat1 + qnorm(.025)*fit$dhat1.se
upper <- fit$dhat1 + qnorm(.975)*fit$dhat1.se
plot(x, dxbase, type="l", ylim=c(min(lower), max(upper)), 
  main="Estimated Slopes", xlab="x", ylab="y")
lines(x, fit$dhat1, col="red")
lines(x, lower, lty="dashed", col="red")
lines(x, upper, lty="dashed", col="red")
legend("topright", c("Base", "Predicted", "95 Percent CI"), 
 col=c("black", "red", "red"),lty=c("solid", "solid", "dashed"), lwd=1)

# Derivative estimates with larger window size
fit <- lwr(y~x,window=.20)
lower <- fit$dhat1 + qnorm(.025)*fit$dhat1.se
upper <- fit$dhat1 + qnorm(.975)*fit$dhat1.se
plot(x, dxbase, type="l", ylim=c(min(lower), max(upper)), 
  main="Estimated Slopes", xlab="x", ylab="y")
lines(x, fit$dhat1, col="red")
lines(x, lower, lty="dashed", col="red")
lines(x, upper, lty="dashed", col="red")
legend("topright", c("Base", "Predicted", "95 Percent CI"), 
 col=c("black", "red", "red"), lty=c("solid", "solid", "dashed"), lwd=1)

## Not run: 
##D #2. Population density data
##D library(RColorBrewer)
##D 
##D cook <- readShapePoly(system.file("maps/CookCensusTracts.shp",
##D   package="McSpatial"))
##D cook$obs <- seq(1:nrow(cook))
##D # measure distance to Chicago city center
##D lmat <- coordinates(cook)
##D cook$LONGITUDE <- lmat[,1]
##D cook$LATITUDE  <- lmat[,2]
##D cook$DCBD <- geodistance(longvar=cook$LONGITUDE,latvar=cook$LATITUDE,
##D   lotarget=-87.627800,latarget=41.881998,dcoor=FALSE)$dist
##D # population density = population/acres,  acres = square mile x 640
##D cook$LNDENS <- log(cook$POPULATION/(cook$AREA*640))
##D densdata <- data.frame(cook[cook$POPULATION>0,])
##D par(ask=TRUE)
##D 
##D # lndens = f(longitude, latitude), weights are function of straight-line distance
##D fit <- lwr(LNDENS~LONGITUDE+LATITUDE,  window=.10, 
##D    distance="Latlong",data=densdata)
##D c(fit$df1, fit$df2, 2*fit$df1-fit$df2)
##D cook$lwrhat[densdata$obs] <- fit$yhat
##D brks <- seq(min(cook$lwrhat,na.rm=TRUE),max(cook$lwrhat,na.rm=TRUE),length=9)
##D spplot(cook,"lwrhat",at=brks,col.regions=rev(brewer.pal(9,"RdBu")),
##D    main="Log Density LWR Estimates")
##D 
## End(Not run)



