library(GSIF)


### Name: SoilGrids-class
### Title: A class for SoilGrids - soil property and/or class maps
### Aliases: SoilGrids-class SoilGrids
### Keywords: classes

### ** Examples

# load soil samples from the plotKML package: 
library(plotKML)
library(aqp)
library(plyr)
library(splines)
library(rgdal)
library(raster)

data(eberg)
## subset data to 10%:
eberg <- eberg[runif(nrow(eberg)) < .1,]
## sites table:
s.lst <- c("ID", "soiltype", "TAXGRSC", "X", "Y")
h.lst <- c("UHDICM","LHDICM","SNDMHT","SLTMHT","CLYMHT")
sites <- eberg[,s.lst]
## get horizons table:
horizons <- getHorizons(eberg, idcol="ID", sel=h.lst)
## create object of type "SoilProfileCollection"
eberg.spc <- join(horizons, sites, type='inner')
depths(eberg.spc) <- ID ~ UHDICM + LHDICM
site(eberg.spc) <- as.formula(paste("~", paste(s.lst[-1], collapse="+"), sep=""))
coordinates(eberg.spc) <- ~X+Y
proj4string(eberg.spc) <- CRS("+init=epsg:31467")
## convert to logits:
eberg.spc@horizons$SNDMHT.t <- log((eberg.spc@horizons$SNDMHT/100)/
    (1-eberg.spc@horizons$SNDMHT/100))
## convert to geosamples:
eberg.geo <- as.geosamples(eberg.spc)
## load gridded data:
data(eberg_grid)
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
## derive spc's:
formulaString <- ~ PRMGEO6+DEMSRT6+TWISRT6+TIRAST6
eberg_spc <- spc(eberg_grid, formulaString)
## build a 3D "gstatModel": 
glm.formulaString = as.formula(paste("SNDMHT.t ~ ", 
     paste(names(eberg_spc@predicted), collapse="+"), "+ ns(altitude, df=4)"))
## Not run: 
##D SNDMHT.m <- fit.gstatModel(observations=eberg.geo, glm.formulaString, 
##D      covariates=eberg_spc@predicted)
##D summary(SNDMHT.m@regModel)
##D SNDMHT.m@vgmModel
##D ## prepare new locations (6 standard depths): 
##D new3D <- sp3D(eberg_spc@predicted)
##D ## Make predictions at six depths:
##D sd.l <- lapply(new3D, FUN=function(x){predict(SNDMHT.m, predictionLocations=x, nfold=0)})
##D ## back-transformation function:
##D invlogit = function(x){exp(x)/(1+exp(x))*100}
##D ## for the back-transformation for the mean value see Diggle and Ribeiro, 2007, p. 148:
##D invlogit.m = function(x, v){((1+exp(-x))^(-1)-.5*v*exp(-x)*(1-exp(-x))*(1+exp(-x))^(-3) )*100}
##D ## back-transform values from logits:
##D for(j in 1:length(sd.l)){ 
##D     sd.l[[j]]@predicted$M <- round(invlogit.m(sd.l[[j]]@predicted$SNDMHT.t,
##D        sd.l[[j]]@predicted$var1.var))
##D     sd.l[[j]]@predicted$L <- round(invlogit(sd.l[[j]]@predicted$SNDMHT.t
##D      - 1.645*sqrt(sd.l[[j]]@predicted$var1.var)))
##D     sd.l[[j]]@predicted$U <- round(invlogit(sd.l[[j]]@predicted$SNDMHT.t
##D      + 1.645*sqrt(sd.l[[j]]@predicted$var1.var))) 
##D }
##D str(sd.l[[1]]@predicted@data)
##D 
##D ## reproject to WGS84 system (100 m resolution):
##D p = get("cellsize", envir = GSIF.opts)[1]
##D s = get("stdepths", envir = GSIF.opts)
##D sd.ll <- sapply(1:length(sd.l), FUN=function(x){ 
##D      make.3Dgrid(sd.l[[x]]@predicted[c("L","M","U")],
##D      pixsize=p, stdepths=s[x])})
##D ## save to a "SoilGrids" object:
##D SNDMHT.gsm <- SoilGrids(obj=sd.ll, varname="SNDPPT", 
##D              TimeSpan=list(begin="1999-02-01", end="2001-07-01"))
##D str(SNDMHT.gsm, max.level=2)
##D ## visualize all maps in Google Earth:
##D data(R_pal)
##D z0 = mean(eberg_grid$DEMSRT6, na.rm=TRUE)
##D ## export grids:
##D for(j in 1:length(sd.ll)){
##D   kml(slot(SNDMHT.gsm, paste("sd", j, sep="")), 
##D      folder.name = paste("eberg_sd", j, sep=""),
##D      file = paste("SNDMHT_sd", j, ".kml", sep=""), 
##D      colour = M, z.lim=c(10,85),
##D      raster_name = paste("SNDMHT_sd", j, ".png", sep=""), 
##D      altitude = z0+5000+(s[j]*2500))
##D }
## End(Not run)



