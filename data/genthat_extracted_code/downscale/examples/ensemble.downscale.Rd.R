library(downscale)


### Name: ensemble.downscale
### Title: Ensemble modelling of multiple downscaling functions
### Aliases: ensemble.downscale

### ** Examples

## example species data
data.file <- system.file("extdata", "atlas_data.txt", package = "downscale")
atlas.data <- read.table(data.file, header = TRUE)

## if the input data is a data frame it must have the columns "x", "y"
## and "presence"
head(atlas.data)

## upgrain data (using All Samples threshold)
occupancy <- upgrain(atlas.data,
                     cell.width = 10,
                     scales = 3,
                     method = "All_Sampled",
                     plot = FALSE)

## ensemble downscaling with an object of class upgrain
ensemble.downscale(occupancies = occupancy,
                   new.areas = c(1, 2, 5, 15, 50, 100, 400, 1600, 6400),
                   cell.width = 10,
                   models = c("Nachman", "PL", "Logis", "GNB", "FNB", "Hui"),
                   plot = TRUE)

## ensemble modelling with data frame of occupancies (not applicable for Hui
## model) with hypothetical species occupancy data
occupancy.dd <- data.frame(Cell.areas = c(100, 400, 1600, 6400),
                           Occupancy = c(0.16, 0.36, 0.59, 0.86))

## now extent must be specified (but cell.width not needed)
ensemble.downscale(occupancies = occupancy.dd,
                   new.areas = c(1, 2, 5, 15, 50, 100, 400, 1600, 6400),
                   extent = 384000,
                   models = c("Nachman", "PL", "Logis", "GNB", "FNB"),
                   plot = TRUE)



