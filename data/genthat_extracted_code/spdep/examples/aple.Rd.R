library(spdep)


### Name: aple
### Title: Approximate profile-likelihood estimator (APLE)
### Aliases: aple
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
wheat <- readOGR(system.file("shapes/wheat.shp", package="spData"))
nbr1 <- poly2nb(wheat, queen=FALSE)
nbrl <- nblag(nbr1, 2)
nbr12 <- nblag_cumul(nbrl)
cms0 <- with(as(wheat, "data.frame"), tapply(yield, c, median))
cms1 <- c(model.matrix(~ factor(c) -1, data=wheat) %*% cms0)
wheat$yield_detrend <- wheat$yield - cms1
isTRUE(all.equal(c(with(as(wheat, "data.frame"),
 tapply(yield_detrend, c, median))), rep(0.0, 25),
 check.attributes=FALSE))
moran.test(wheat$yield_detrend, nb2listw(nbr12, style="W"))
aple(as.vector(scale(wheat$yield_detrend, scale=FALSE)), nb2listw(nbr12, style="W"))
## No test: 
errorsarlm(yield_detrend ~ 1, wheat, nb2listw(nbr12, style="W"))
## End(No test)
}



