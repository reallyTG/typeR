library(downscale)


### Name: downscale
### Title: Model area of occupancy against grain size for downscaling
### Aliases: downscale

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

## upgrain data (using All Sampled threshold)
occupancy <- upgrain(atlas.data,
                     cell.width = 10,
                     scales = 3,
                     method = "All_Sampled")

## Logistic model
(logis <- downscale(occupancies = occupancy,
                    model = "Logis"))
                    
### predict occupancy at finer grain sizes
pred <- predict(logis,
                new.areas = c(1, 2, 5, 25, 100, 400, 1600, 6400))
                
### Plot predictions
plot(pred)

## Improved Negative Binomial model
(inb <- downscale(occupancies = occupancy,
                  model = "INB"))

## Specifying the starting parameters (gives a poorer fit in this case)
new.params <- list("C" = 0.1, "gamma" = 0.00001, "b" = 0.1)
(inb.new <- downscale(occupancies = occupancy,
                      model = "INB",
                      starting_params = new.params))

## plot the predictions of two FNB models using predict.downscale
predict(inb,
        new.areas = c(1, 2, 5, 25, 100, 400, 1600, 6400),
        plot = TRUE)
predict(inb.new,
        new.areas = c(1, 2, 5, 25, 100, 400, 1600, 6400),
        plot = TRUE)



