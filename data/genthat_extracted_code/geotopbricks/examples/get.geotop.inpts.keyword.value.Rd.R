library(geotopbricks)


### Name: get.geotop.inpts.keyword.value
### Title: Importing a GEOtop Keyword and its Value into R
### Aliases: get.geotop.inpts.keyword.value

### ** Examples


library(geotopbricks)

#Simulation working path
wpath <- 'http://www.rendena100.eu/public/geotopbricks/simulations/panola13_run2xC_test3'
prefix <- get.geotop.inpts.keyword.value("SoilLiqWaterPressTensorFile",wpath=wpath)

slope <- get.geotop.inpts.keyword.value("SlopeMapFile",raster=TRUE,wpath=wpath) 
bedrock_depth <- get.geotop.inpts.keyword.value("BedrockDepthMapFile",raster=TRUE,wpath=wpath) 

layers <- get.geotop.inpts.keyword.value("SoilLayerThicknesses",numeric=TRUE,wpath=wpath)
names(layers) <- paste("L",1:length(layers),sep="")

##### set van genuchten parameters to estimate water volume 
theta_sat <- get.geotop.inpts.keyword.value("ThetaSat",numeric=TRUE,wpath=wpath)
theta_res <- get.geotop.inpts.keyword.value("ThetaRes",numeric=TRUE,wpath=wpath)
alphaVG <-  get.geotop.inpts.keyword.value("AlphaVanGenuchten",
numeric=TRUE,wpath=wpath) # expressed in mm^-1

nVG <-  get.geotop.inpts.keyword.value("NVanGenuchten",numeric=TRUE,wpath=wpath) 


##### end set van genuchten parameters to estimate water volume


##### set meteo data

start <-  get.geotop.inpts.keyword.value("InitDateDDMMYYYYhhmm",date=TRUE,wpath=wpath,tz="A") 
end <- get.geotop.inpts.keyword.value("EndDateDDMMYYYYhhmm",date=TRUE,wpath=wpath,tz="A") 

nmeteo <- get.geotop.inpts.keyword.value("NumberOfMeteoStations",numeric=TRUE,wpath=wpath)
level <- 1:nmeteo

# Uncomment the following lises to run the R code: 

## set meteo data


 ## Not run: 
##D # meteo <- get.geotop.inpts.keyword.value("MeteoFile",wpath=wpath,data.frame=TRUE,
##D #       level=level,start_date=start,end_date=end)
## End(Not run)

##### end set meteo data

## IMPORTING AN OUTPUT SOIL MOISTURE PROFILE: 

 wpath <- 'http://www.rendena100.eu/public/geotopbricks/simulations/Muntatschini_pnt_1_225_B2_004'

## Not run: 
##D #	SMC  <- get.geotop.inpts.keyword.value("SoilLiqContentProfileFile",
##D #          wpath=wpath,data.frame=TRUE,date_field="Date12.DDMMYYYYhhmm.",
##D #          formatter="%04d")
##D #
##D #    SMCz  <- get.geotop.inpts.keyword.value("SoilLiqContentProfileFile",
##D #         wpath=wpath,data.frame=TRUE,date_field="Date12.DDMMYYYYhhmm.",
##D #          formatter="%04d",zlayer.formatter="z%04d")
## End(Not run)


		







