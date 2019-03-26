library(GSIF)


### Name: spsample.prob
### Title: Estimate occurrence probabilities of a sampling plan (points)
### Aliases: spsample.prob
###   spsample.prob,SpatialPoints,SpatialPixelsDataFrame-method

### ** Examples

library(plotKML)
library(maxlike)
library(spatstat)
library(maptools)

data(eberg)
data(eberg_grid)
## existing sampling plan:
sel <- runif(nrow(eberg)) < .2
eberg.xy <- eberg[sel,c("X","Y")]
coordinates(eberg.xy) <- ~X+Y
proj4string(eberg.xy) <- CRS("+init=epsg:31467")
## covariates:
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
## convert to continuous independent covariates:
formulaString <- ~ PRMGEO6+DEMSRT6+TWISRT6+TIRAST6
eberg_spc <- spc(eberg_grid, formulaString)

## derive occurrence probability:
covs <- eberg_spc@predicted[1:8]
iprob <- spsample.prob(eberg.xy, covs)
## Note: obvious omission areas:
hist(iprob[[1]]@data[,1])
## compare with random sampling:
rnd <- spsample(eberg_grid, type="random",
     n=length(iprob[["observations"]]))
iprob2 <- spsample.prob(rnd, covs)
## compare the two:
par(mfrow=c(1,2))
plot(raster(iprob[[1]]), zlim=c(0,1), col=SAGA_pal[[1]])
points(iprob[["observations"]])
plot(raster(iprob2[[1]]), zlim=c(0,1), col=SAGA_pal[[1]])
points(iprob2[["observations"]])

## fit a weighted lm:
eberg.xy <- eberg[sel,c("SNDMHT_A","X","Y")]
coordinates(eberg.xy) <- ~X+Y
proj4string(eberg.xy) <- CRS("+init=epsg:31467")
eberg.xy$iprob <- over(eberg.xy, iprob[[1]])$iprob
eberg.xy@data <- cbind(eberg.xy@data, over(eberg.xy, covs))
fs <- as.formula(paste("SNDMHT_A ~ ", 
    paste(names(covs), collapse="+")))
## the lower the occurrence probability, the higher the weight:
w <- 1/eberg.xy$iprob
m <- lm(fs, eberg.xy, weights=w)
summary(m)
## compare to standard lm:
m0 <- lm(fs, eberg.xy)
summary(m)$adj.r.squared
summary(m0)$adj.r.squared

## all at once:
gm <- fit.gstatModel(eberg.xy, fs, covs, weights=w)
plot(gm)



