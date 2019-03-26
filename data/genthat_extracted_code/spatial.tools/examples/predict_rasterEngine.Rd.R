library(spatial.tools)


### Name: predict_rasterEngine
### Title: Model predictions (including Raster* objects)
### Aliases: predict_rasterEngine

### ** Examples

library("raster")
# This example creates a linear model relating a vegetation
# index (NDVI) to vegetation height, and applies it to a raster
# of NDVI.

# Load up a 3-band image:
tahoe_highrez <- setMinMax(
		brick(system.file("external/tahoe_highrez.tif", package="spatial.tools")))

# Determine NDVI
ndvi_nodrop <- function(GRNIR_image)
{
	red_band <- GRNIR_image[,,2,drop=FALSE]
	nir_band <- GRNIR_image[,,3,drop=FALSE]	
	ndvi <- (nir_band-red_band)/(nir_band + red_band)
	return(ndvi)
}

tahoe_ndvi <- rasterEngine(GRNIR_image=tahoe_highrez,fun=ndvi_nodrop)
names(tahoe_ndvi) <- "ndvi"

# Load up Lidar files
tahoe_lidar_highesthit <- setMinMax(
		raster(system.file("external/tahoe_lidar_highesthit.tif", package="spatial.tools")))

tahoe_lidar_bareearth <- setMinMax(
		raster(system.file("external/tahoe_lidar_bareearth.tif", package="spatial.tools")))

# Determine vegetation height:
LIDAR_height <- function(bareearth,firstreturn)
{
	height <- firstreturn-bareearth
	return(height)
}

tahoe_height <- rasterEngine(
		bareearth=tahoe_lidar_bareearth,
		firstreturn=tahoe_lidar_highesthit,
		fun=LIDAR_height)
names(tahoe_height) <- "vegetation_height"

# Stack them:
tahoe_analysis_stack <- stack(tahoe_ndvi,tahoe_height)

# Pick some random points from the stack
randomly_extracted_data <- as.data.frame(sampleRandom(tahoe_analysis_stack,size=100))

# Generate a linear model from these points:
height_from_ndvi_model <- lm(vegetation_height~ndvi,data=randomly_extracted_data)

# Apply model to NDVI image:
# Enable parallel engine to run larger images faster:
# sfQuickInit()
height_from_ndvi_raster <- predict_rasterEngine(object=height_from_ndvi_model,newdata=tahoe_ndvi)
# sfQuickStop()



