library(McSpatial)


### Name: qregcpar
### Title: Conditionally Parametric LWR Quantile Estimation
### Aliases: qregcpar
### Keywords: Quantile Regression Nonparametric Conditionally Parametric

### ** Examples

data(cookdata)
cookdata$obs <- seq(1,nrow(cookdata))
cookdata <- cookdata[!is.na(cookdata$FAR),]
par(ask=TRUE)

# 1. CPAR LWR estimates, y = a(DCBD) + b(dcbd)*DCBD + u
fit <- qregcpar(LNFAR~DCBD,nonpar=~DCBD, taumat=c(.10,.50,.90), 
  kern="bisq", window=.30, data=cookdata)
o <- order(cookdata$DCBD)
plot(cookdata$DCBD[o], fit$yhat[o,1],type="l", main="Log Floor Area Ratio",
  xlab="Distance from CBD",ylab="Log FAR")
lines(cookdata$DCBD[o], fit$yhat[o,2])
lines(cookdata$DCBD[o], fit$yhat[o,3])

## Not run: 
##D # 2. CPAR estimates, y = a(lat,long) + b(lat,long)xDCBD + u
##D fit <- qregcpar(LNFAR~DCBD, nonpar=~LATITUDE+LONGITUDE, taumat=c(.10,.90), 
##D   kern="bisq", window=.30, distance="LATLONG", data=cookdata)
##D plot(cookdata$DCBD, cookdata$LNFAR,main="Log Floor Area Ratio",
##D   xlab="Distance from CBD",ylab="Log FAR")
##D points(cookdata$DCBD, fit$yhat[,1], col="red")
##D plot(cookdata$DCBD, cookdata$LNFAR,main="Log Floor Area Ratio",
##D   xlab="Distance from CBD",ylab="Log FAR")
##D points(cookdata$DCBD, fit$yhat[,2], col="red")
##D 
##D library(RColorBrewer)
##D cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
##D   package="McSpatial"))
##D cmap$yhat10[cookdata$obs] <- fit$yhat[,1]
##D cmap$yhat90[cookdata$obs] <- fit$yhat[,2]
##D cmap$yhat1090 <- cmap$yhat90 - cmap$yhat10
##D brks <- seq(min(cmap$yhat1090,na.rm=TRUE),max(cmap$yhat1090,na.rm=TRUE),length=9)
##D spplot(cmap,"yhat1090",at=brks,col.regions=rev(brewer.pal(9,"RdBu")),
##D   main="Difference between .10 and.90 Quantiles")
## End(Not run)



