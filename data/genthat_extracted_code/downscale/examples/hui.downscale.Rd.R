library(downscale)


### Name: hui.downscale
### Title: Predict occupancy at fine grain sizes using the Hui model
### Aliases: hui.downscale

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## if the input data is a data frame it must have the columns "x", "y"
## and "presence"
head(atlas.data)

## Fit Hui model to atlas.data
(hui <- hui.downscale(atlas.data, 
                      cell.width = 10,
                      extent = 228900,
                      new.areas = c(1, 2, 5, 15, 50,75),
                      plot = TRUE))

## Fit Hui model to standardised atlas data for comparison with other models
## First, upgrain data (using All Sampled threshold)
occupancy <- upgrain(atlas.data,
                     cell.width = 10,
                     scales = 3,
                     method = "All_Sampled")
                     
## the "upgrain" object can be used as input for the Hui model
(hui.stand <- hui.downscale(occupancy,
                            cell.width = 10,
                            new.areas = c(1, 2, 5, 15, 50,75),
                            plot = TRUE))

## compare the area of occupancy (AOO) predictions of the two models
hui$predicted
hui.stand$predicted



