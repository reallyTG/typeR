library(downscale)


### Name: upgrain
### Title: Upgraining of atlas data to larger grain sizes
### Aliases: upgrain

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## if the input data is a data frame it must have the columns "x", "y"
## and "presence"
head(atlas.data)

## explore thresholds using upgrain.threshold
thresh <- upgrain.threshold(atlas.data = atlas.data,
                            cell.width = 10,
                            scales = 3,
                            thresholds = seq(0, 1, 0.1))

## use a specified threshold - method must equal NULL
upgrain(atlas.data = atlas.data,
        cell.width= 10,
        scales = 3,
        threshold = 0.15,
        method = NULL)
        
## use one of the suggested methods - do not specify a threshold
all_sampled <- upgrain(atlas.data = atlas.data,
                       cell.width= 10,
                       scales = 3,
                       method = "All_Sampled")
        

## input data for downscale for All Sampled threshold
all_sampled$occupancy.stand

## and the original occupancies (note that extent varies with scale)
all_sampled$occupancy.orig

## if data is SpatialPointsDataFrame
presence <- data.frame(presence = atlas.data$presence)
spdf <- SpatialPointsDataFrame(coords = data.frame(x = atlas.data$x, 
                                                   y = atlas.data$y),
                               data = presence)
                               
all_sampled <- upgrain(atlas.data = spdf,
                       cell.width= 10,
                       scales = 3,
                       method = "All_Sampled")  



