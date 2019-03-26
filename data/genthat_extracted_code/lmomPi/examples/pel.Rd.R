library(lmomPi)


### Name: pel
### Title: Generic function for 'pel...'
### Aliases: pel pel pel_x pel pel_lmom

### ** Examples


 # Sample L-moments of Ozone from the airquality data
 data(airquality)
 lmom <- samlmu(airquality$Ozone,nmom=6)
 distrib <- "gev"    
 # Fit a GEV distribution
 out_gev <- pel(distrib=distrib,lmom=lmom)

 distrib <- c("exp","gam","gev","glo","gpa","gno","gum","kap","ln3",
 "nor","pe3","wak","wei")

 out_list <- pel(distrib=distrib,lmom=lmom)

 library(rasterList)
 precff <- system.file("map/Mekrou_precipitation.grd", package="rasterList")
	precs <- stack(precff)
 prec_point <- precs[143][,]
 ## month index 
 month <- as.character(as.Date(names(prec_point),format="X%Y.%m.%d"),format="M%m")
 distrib_prec <- c("gam","pe3")
 out_x <- pel(x=prec_point,indices=month,distrib=distrib_prec)
 out_spi3_x <- pel(x=prec_point,indices=month,distrib=distrib_prec,spi.scale=3)
 distrib_prec2 <- c("gam")
 out_x <- pel(x=prec_point,indices=month,distrib=distrib_prec2)
 out_spi3_x <- pel(x=prec_point,indices=month,distrib=distrib_prec2,spi.scale=3)

 ### example with PEL when x is always 0 or a fixed constant
 xx <- array(0,50)
 out_xx <- pel_x(x=xx,distrib=distrib_prec2)
 





