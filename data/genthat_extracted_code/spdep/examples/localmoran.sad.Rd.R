library(spdep)


### Name: localmoran.sad
### Title: Saddlepoint approximation of local Moran's Ii tests
### Aliases: localmoran.sad listw2star print.summary.localmoransad
###   summary.localmoransad print.localmoransad as.data.frame.localmoransad
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
eire <- readOGR(system.file("shapes/eire.shp", package="spData")[1])
row.names(eire) <- as.character(eire$names)
proj4string(eire) <- CRS("+proj=utm +zone=30 +ellps=airy +units=km")
eire.nb <- poly2nb(eire)
lw <- nb2listw(eire.nb)
e.lm <- lm(OWNCONS ~ ROADACC, data=eire)
e.locmor <- summary(localmoran.sad(e.lm, nb=eire.nb))
e.locmor
mean(e.locmor[,1])
sum(e.locmor[,1])/Szero(lw)
lm.morantest(e.lm, lw)
# note equality for mean() only when the sum of weights equals
# the number of observations (thanks to Juergen Symanzik)
hist(e.locmor[,"Pr. (Sad)"])
e.wlm <- lm(OWNCONS ~ ROADACC, data=eire, weights=RETSALE)
e.locmorw1 <- summary(localmoran.sad(e.wlm, nb=eire.nb, resfun=weighted.residuals))
e.locmorw1
e.locmorw2 <- summary(localmoran.sad(e.wlm, nb=eire.nb, resfun=rstudent))
e.locmorw2
e.errorsar <- errorsarlm(OWNCONS ~ ROADACC, data=eire,
  listw=lw)
e.errorsar
lm.target <- lm(e.errorsar$tary ~ e.errorsar$tarX - 1)
Omega <- tcrossprod(invIrW(lw, rho=e.errorsar$lambda))
e.clocmor <- summary(localmoran.sad(lm.target, nb=eire.nb, Omega=Omega))
e.clocmor
hist(e.clocmor[,"Pr. (Sad)"])
}



