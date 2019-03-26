library(IsoriX)


### Name: prepcipitate
### Title: Prepare the raster brick containing the precipitation data
### Aliases: prepcipitate

### ** Examples


## The following example takes some time and download a large amount of data (~ 1 Gb).
## It will therefore not be run unless you uncomment it

### We fit the models for Germany:
#GNIPDataDEagg <- prepsources(data = GNIPDataDE)
#
#GermanFit <- isofit(data = GNIPDataDEagg,
#                    mean_model_fix = list(elev = TRUE, lat.abs = TRUE))
#
#StrRaster <- prepraster(raster = ElevRasterDE,
#                        isofit = GermanFit,
#                        aggregation_factor = 0)
#
#getprecip(path = "~/Desktop/")
#
#PrecipitationBrick <- prepcipitate(path = "~/Desktop/",
#                                   raster = StrRaster
#                                   )
#levelplot(PrecipitationBrick)




