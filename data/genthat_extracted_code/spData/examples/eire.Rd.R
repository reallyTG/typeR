library(spData)


### Name: eire
### Title: Eire data sets
### Aliases: eire eire.df eire.polys.utm eire.coords.utm eire.nb
### Keywords: datasets sp spdep

### ** Examples

## Not run: 
##D library(maptools)
##D library(rgdal)
##D library(spdep)
##D eire <- readOGR(system.file("shapes/eire.shp", package="spData")[1])
##D eire.nb <- poly2nb(eire)
##D 
##D data(eire)
##D # Eire physical anthropology blood group data
##D summary(eire$A)
##D brks <- round(fivenum(eire$A), digits=2)
##D cols <- rev(heat.colors(4))
##D plot(eire, col=cols[findInterval(eire$A, brks, all.inside=TRUE)])
##D title(main="Percentage with blood group A in Eire")
##D legend(x=c(-50, 70), y=c(6120, 6050), leglabs(brks), fill=cols, bty="n")
##D 
##D plot(eire)
##D plot(eire.nb, coordinates(eire), add=TRUE)
##D 
##D lA <- lag.listw(nb2listw(eire.nb), eire$A)
##D summary(lA)
##D moran.test(eire$A, nb2listw(eire.nb))
##D geary.test(eire$A, nb2listw(eire.nb))
##D cor(lA, eire$A)
##D moran.plot(eire$A, nb2listw(eire.nb), labels=eire$names)
##D A.lm <- lm(A ~ towns + pale, data=eire)
##D summary(A.lm)
##D res <- residuals(A.lm)
##D brks <- c(min(res),-2,-1,0,1,2,max(res))
##D cols <- rev(cm.colors(6))
##D 
##D plot(eire, col=cols[findInterval(res, brks, all.inside=TRUE)])
##D title(main="Regression residuals")
##D legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cols, bty="n")
##D 
##D lm.morantest(A.lm, nb2listw(eire.nb))
##D lm.morantest.sad(A.lm, nb2listw(eire.nb))
##D lm.LMtests(A.lm, nb2listw(eire.nb), test="LMerr")
##D 
##D # Eire agricultural data
##D brks <- round(fivenum(eire$OWNCONS), digits=2)
##D cols <- grey(4:1/5)
##D plot(eire, col=cols[findInterval(eire$OWNCONS, brks, all.inside=TRUE)])
##D title(main="Percentage own consumption of agricultural produce")
##D legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cols, bty="n")
##D 
##D moran.plot(eire$OWNCONS, nb2listw(eire.nb))
##D moran.test(eire$OWNCONS, nb2listw(eire.nb))
##D e.lm <- lm(OWNCONS ~ ROADACC, data=eire)
##D res <- residuals(e.lm)
##D brks <- c(min(res),-2,-1,0,1,2,max(res))
##D cols <- rev(cm.colors(6))
##D plot(eire, col=cols[findInterval(res, brks, all.inside=TRUE)])
##D title(main="Regression residuals")
##D legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cm.colors(6), bty="n")
##D 
##D lm.morantest(e.lm, nb2listw(eire.nb))
##D lm.morantest.sad(e.lm, nb2listw(eire.nb))
##D lm.LMtests(e.lm, nb2listw(eire.nb), test="LMerr")
##D print(localmoran.sad(e.lm, eire.nb, select=1:length(slot(eire, "polygons"))))
## End(Not run)



