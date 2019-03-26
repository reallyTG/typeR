library(mrfDepth)


### Name: distSpace
### Title: distSpace
### Aliases: distSpace
### Keywords: functional multivariate

### ** Examples


# We will use two multivariate toy data sets
data(cardata90)
data(bloodfat)

# Build the training data
trainingData <- list(set1 = cardata90,
                     set2 = bloodfat)
# Transform the data into distspace
Result <- distSpace(trainingData = trainingData)
# Plot the results
plotColors <- c(rep("orange", nrow(cardata90)),
                rep("blue", nrow(bloodfat)))
plot(Result[, 1:2],
     col = plotColors,
     xlab = "distance to cardata90", ylab = "distance to bloodfat",
     main = "distspace representation of cardata90 and the bloodfat data.")


# By default the bagdistance is used to transform the data. 
# This can be changed by using the type argument. Additional option to be
# passed to the underlying function calculatin the distance may be passed in 
# the option argument.
options <- list(type = "Affine", ndir = 1000, seed = 3)
Result <- distSpace(trainingData = trainingData,
                    type = "adjOutl",
                    options = options)
# Plot the results
plotColors <- c(rep("orange", nrow(cardata90)),
                rep("blue", nrow(bloodfat)))
plot(Result[, 1:2],
     col = plotColors,
     xlab = "distance to cardata90", ylab = "distance to bloodfat",
     main = "distspace representation of cardata90 and the bloodfat data.")

data(octane)
data(glass)
trainingData <- list(set1 = glass[1:100,, , drop = FALSE],
                     set2 = octane[1:100,, , drop = FALSE])
# Transform the data into distspace
Result <- distSpace(trainingData = trainingData, type = "fAO")




