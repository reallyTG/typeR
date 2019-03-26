library(lmomPi)


### Name: cdf
### Title: Generic function for 'cdf...': probability distribution fitting
###   with L-Moments.
### Aliases: cdf spi.cdf cdf.spi

### ** Examples


# Sample L-moments of Ozone from the airquality data
data(airquality)
lmom <- samlmu(airquality$Ozone,nmom=6)

distrib <- c("exp","gam","gev","glo","gpa","gno","gum","kap",
"ln3","nor","pe3","wak","wei")

para_list <- pel(distrib=distrib,lmom=lmom)
cdf_list <- cdf(para=para_list,x=airquality$Ozone)

 library(rasterList)
 precff <- system.file("map/Mekrou_precipitation.grd", package="rasterList")
	precs <- stack(precff)
 prec_point <- precs[143][,]

 ## month index 
 month <- as.character(as.Date(names(prec_point),format="X%Y.%m.%d"),format="M%m")
 prec_point[(prec_point<1) & (month=="M01")] <- 0

 distrib_prec2 <- c("gam")
 para_vvv <- pel(x=prec_point,indices=month,distrib=distrib_prec2)
 cdf_      <- cdf(x=prec_point,indices=month,para=para_vvv)      
	spi_      <- spi.cdf(x=prec_point,indices=month,para=para_vvv)  

 ####  
 ## Not run: 
##D  para_raster <- rasterList(precs,FUN=pel_x,indices=month,distrib=distrib_prec2)
##D  spi1_raster <- stack(RasterListApply(x=rasterList(precs),para=para_raster,
##D                 indices=list(month),FUN=spi.cdf))
##D 
##D   para_raster_spi3 <- rasterList(precs,FUN=pel_x,indices=month,distrib=distrib_prec2,
##D 						spi.scale=3)
##D   spi3_raster <- stack(RasterListApply(x=rasterList(precs),para=para_raster_spi3,
##D                 indices=list(month),spi.scale=3,FUN=spi.cdf))
## End(Not run)


## Comparison with the SPI/SPEI algorithms:  'SPEI::spi' ('SPEI' package)
library(SPEI)

data(wichita)

distrib_wichita <- 'pe3'
spi.scale <- 1

month_wichita <- sprintf("M%02d",wichita$MONTH)
para_whichita  <- pel(x=wichita$PRCP,indices=month_wichita,distrib=distrib_wichita,
						spi.scale=spi.scale)
spi_wichita   <- spi.cdf(x=wichita$PRCP,indices=month_wichita,para=para_whichita,
						spi.scale=spi.scale)
spi_wichita_speipkg   <- spi(data=wichita$PRCP,distrib='PearsonIII',scale=spi.scale)
difference <- spi_wichita-spi_wichita_speipkg$fitted





