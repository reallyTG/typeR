library(McSpatial)


### Name: qreglwr
### Title: Locally Weighted Quantile Regression
### Aliases: qreglwr
### Keywords: Quantile Regression Nonparametric

### ** Examples

data(cookdata)
cookdata <- cookdata[cookdata$CHICAGO==1,]
cookdata$obs <- seq(1:nrow(cookdata))
cookdata <- cookdata[cookdata$CHICAGO==1&cookdata$POPULATION>0,]
par(ask=TRUE)

# lndens = f(dcbd)
fit <- lwr(LNDENS~DCBD,window=.20,data=cookdata)
fit1 <- qreglwr(LNDENS~DCBD,taumat=c(.10,.50,.90),window=.30,kern="rect",data=cookdata)
o <- order(cookdata$DCBD)
ymin = min(fit1$yhat)
ymax = max(fit1$yhat)
plot(cookdata$DCBD[o], fit$yhat[o], type="l", ylim=c(ymin,ymax),
  xlab="Distance to CBD", ylab="Log of Population Density")
lines(cookdata$DCBD[o], fit1$yhat[o,1], col="red", lty="dashed")
lines(cookdata$DCBD[o], fit1$yhat[o,2], col="red")
lines(cookdata$DCBD[o], fit1$yhat[o,3], col="red", lty="dashed")
legend("topright", c("LWR", "tau = 50", "tau = 10, 90"), col=c("black","red", "red"), 
  lwd=1, lty=c("solid","solid","dashed"))

## Not run: 
##D library(RColorBrewer)
##D cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
##D   package="McSpatial"))
##D cmap <- cmap[cmap$CHICAGO==1,]
##D # lndens = f(longitude, latitude), weights are function of straight-line distance
##D fit <- qreglwr(LNDENS~LONGITUDE+LATITUDE,taumat=c(.10,.50,.90),window=.20,data=cookdata)
##D cmap$lwr10[cookdata$obs] <- fit$yhat[,1]
##D cmap$lwr50[cookdata$obs] <- fit$yhat[,2]
##D cmap$lwr90[cookdata$obs] <- fit$yhat[,3]
##D cmap$lwr1090[cookdata$obs] <- fit$yhat[,3] - fit$yhat[,1]
##D brks <- seq(min(cmap$lwr10,na.rm=TRUE),max(cmap$lwr10,na.rm=TRUE),length=9)
##D spplot(cmap,"lwr10",at=brks,col.regions=rev(brewer.pal(8,"RdBu")),
##D    main="Log Density Estimates, tau = .10")
##D brks <- seq(min(cmap$lwr50,na.rm=TRUE),max(cmap$lwr50,na.rm=TRUE),length=9)
##D spplot(cmap,"lwr50",at=brks,col.regions=rev(brewer.pal(8,"RdBu")),
##D    main="Log Density Estimates, tau = .50")
##D brks <- seq(min(cmap$lwr90,na.rm=TRUE),max(cmap$lwr90,na.rm=TRUE),length=9)
##D spplot(cmap,"lwr90",at=brks,col.regions=rev(brewer.pal(8,"RdBu")),
##D    main="Log Density Estimates, tau = .90")
##D brks <- seq(min(cmap$lwr1090,na.rm=TRUE),max(cmap$lwr1090,na.rm=TRUE),length=9)
##D spplot(cmap,"lwr1090",at=brks,col.regions=rev(brewer.pal(8,"RdBu")),
##D    main="Difference in Log Density, tau = .90 - .10")
## End(Not run)



