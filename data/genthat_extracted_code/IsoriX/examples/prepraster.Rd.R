library(IsoriX)


### Name: prepraster
### Title: Prepare the structural raster
### Aliases: prepraster
### Keywords: utilities

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We fit the models for Germany
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

GermanFit <- isofit(data = GNIPDataDEagg,
                    mean_model_fix = list(elev = TRUE, lat_abs = TRUE))

### Let's explore the difference between aggregation schemes

## We aggregate and crop using different settings
ElevationRaster1 <- prepraster(
    raster = ElevRasterDE,
    isofit = GermanFit,
    margin_pct = 0,
    aggregation_factor = 0)

ElevationRaster2 <- prepraster(
    raster = ElevRasterDE,
    isofit = GermanFit,
    margin_pct = 5,
    aggregation_factor = 5)

ElevationRaster3 <- prepraster(
    raster = ElevRasterDE,
    isofit = GermanFit,
    margin_pct = 10,
    aggregation_factor = 5, aggregation_fn = max)

## We build the plots of the outcome of the 3 different aggregation schemes
PlotAggregation1 <- levelplot(ElevationRaster1,
        margin = FALSE, main = "Original small raster") + 
    layer(sp.polygons(CountryBorders)) +
    layer(sp.polygons(OceanMask, fill = "blue"))
PlotAggregation2 <- levelplot(ElevationRaster2,
        margin = FALSE, main = "Small raster aggregated (by mean)") + 
    layer(sp.polygons(CountryBorders)) +
    layer(sp.polygons(OceanMask, fill = "blue"))
PlotAggregation3 <- levelplot(ElevationRaster3,
        margin = FALSE, main = "Small raster aggregated (by max)") + 
    layer(sp.polygons(CountryBorders)) +
    layer(sp.polygons(OceanMask, fill = "blue"))  

## We plot as a panel using lattice syntax:
print(PlotAggregation1, split = c(1, 1, 3, 1), more = TRUE)
print(PlotAggregation2, split = c(2, 1, 3, 1), more = TRUE)
print(PlotAggregation3, split = c(3, 1, 3, 1))
}

## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 10) {

### Let's create a raster centered around the pacific

## We first create an empty raster
EmptyRaster <- raster(matrix(0, ncol = 360, nrow = 180))
extent(EmptyRaster) <- c(-180, 180, -90, 90)
projection(EmptyRaster) <- CRS("+proj=longlat +datum=WGS84")

## We crop it around the pacific
PacificA <- prepraster(EmptyRaster, manual_crop = c(110, -70, -90, 90))
extent(PacificA) # note that the extent has changed!

## We plot (note the use of the function shift()!)
levelplot(PacificA, margin = FALSE, colorkey = FALSE, col = "blue")+
  layer(sp.polygons(CountryBorders, fill = "black"))+
  layer(sp.polygons(shift(CountryBorders, x = 360), fill = "black"))

}




