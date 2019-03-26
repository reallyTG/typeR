library(downscale)


### Name: plot.predict.downscale
### Title: Plotting of downscaled occupancy at fine grain sizes
### Aliases: plot.predict.downscale

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## upgrain data (using All Occurrences threshold)
occupancy <- upgrain(atlas.data,
                     cell.width = 10,
                     scales = 3,
                     method = "All_Sampled",
                     plot = FALSE)

## Logistic model
logis <- downscale(occupancies = occupancy,
                   model = "Logis")

## predict occupancies at fine scales
logis.pred <- predict(logis,
                      new.areas = c(1, 5, 25, 100, 400, 1600, 6400))

## plot predictions
plot(logis.pred)

## change some of the plotting arguments
plot(logis.pred,
     col.obs = "blue",
     pch = 16,
     ylim = c(0.01, 0.7))



