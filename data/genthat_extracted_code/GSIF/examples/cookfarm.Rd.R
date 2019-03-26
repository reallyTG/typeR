library(GSIF)


### Name: cookfarm
### Title: The Cook Agronomy Farm data set
### Aliases: cookfarm
### Keywords: datasets

### ** Examples

## An example for 3D+T modelling applied to the cookfarm data set can be assesed via 
## demo(cookfarm_3DT_kriging)
## demo(cookfarm_3DT_RF)
## Please note that the demo's might take 10-15 minutes to complete.
library(rgdal)
library(sp)
library(spacetime)
library(aqp)
library(splines)
library(randomForest)
library(plyr)
library(plotKML)
data(cookfarm)

## gridded data:
grid10m <- cookfarm$grids
gridded(grid10m) <- ~x+y
proj4string(grid10m) <- CRS(cookfarm$proj4string)
spplot(grid10m["DEM"], col.regions=SAGA_pal[[1]])

## soil profiles:
profs <- cookfarm$profiles
levels(cookfarm$profiles$HZDUSD)
## Bt horizon:
sel.Bt <- grep("Bt", profs$HZDUSD, ignore.case=FALSE, fixed=FALSE)
profs$Bt <- 0
profs$Bt[sel.Bt] <- 1
depths(profs) <- SOURCEID ~ UHDICM + LHDICM
site(profs) <- ~ TAXSUSDA + Easting + Northing
coordinates(profs) <- ~Easting + Northing
proj4string(profs) <- CRS(cookfarm$proj4string)
profs.geo <- as.geosamples(profs)

## fit model for Bt horizon:
m.Bt <- GSIF::fit.gstatModel(profs.geo, Bt~DEM+TWI+MUSYM+Cook_fall_ECa
   +Cook_spr_ECa+ns(altitude, df = 4), grid10m, fit.family = binomial(logit))
plot(m.Bt)

## fit model for soil pH:
m.PHI <- fit.gstatModel(profs.geo, PHIHOX~DEM+TWI+MUSYM+Cook_fall_ECa
    +Cook_spr_ECa+ns(altitude, df = 4), grid10m)
plot(m.PHI)



