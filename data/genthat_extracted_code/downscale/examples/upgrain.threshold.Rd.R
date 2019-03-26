library(downscale)


### Name: upgrain.threshold
### Title: Exploration of trade-offs in threshold selection for upgraining
### Aliases: upgrain.threshold

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## if the input data is a data frame it must have the columns "x", "y"
## and "presence"
head(atlas.data)

thresh <- upgrain.threshold(atlas.data = atlas.data,
                            cell.width = 10,
                            scales = 3,
                            thresholds = seq(0, 1, 0.02))

## the four optional thresholds
thresh$Thresholds
head(thresh$Data)



