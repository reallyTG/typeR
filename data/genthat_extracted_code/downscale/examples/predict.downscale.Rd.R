library(downscale)


### Name: predict.downscale
### Title: Predict occupancy at fine grain sizes
### Aliases: predict.downscale

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## if the input data is a data frame it must have the columns "lon", "lat"
## and "presence"
head(atlas.data)

## explore thresholds using upgrain.threshold
thresh <- upgrain.threshold(atlas.data = atlas.data,
                            cell.width = 10,
                            scales = 3,
                            thresholds = seq(0, 1, 0.1))

## upgrain data (using All Sampled threshold)
occupancy <- upgrain(atlas.data,
                     cell.width = 10,
                     scales = 3,
                     method = "All_Sampled")

## Logistic model
(logis <- downscale(occupancies = occupancy,
                      model = "Logis"))

## Predictions occupancy at finer scales
logis.pred <- predict(logis,
                      new.areas = c(1, 2, 5, 25, 100),
                      plot = FALSE)
logis.pred
plot(logis.pred)

## It can also be a good idea to include the observed cell sizes in the
## predictions to observe the fit of the model (this time run plot = TRUE)
predict(logis,
        new.areas = c(1, 2, 5, 25, 100, 400, 1600, 6400),
        plot = TRUE)



