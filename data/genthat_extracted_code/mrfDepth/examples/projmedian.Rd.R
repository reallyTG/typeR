library(mrfDepth)


### Name: projmedian
### Title: Location estimates based on projection depth.
### Aliases: projmedian
### Keywords: multivariate

### ** Examples


# Compute a location estimate of a simple two-dimensional dataset.
if (requireNamespace("robustbase", quietly = TRUE)) {
  BivData <- log(robustbase::Animals2)
} else {
  BivData <- matrix(rnorm(120), ncol = 2)
  BivData <- rbind(BivData, matrix(c(6,6, 6, -2), ncol = 2))
}

result <- projmedian(x = BivData)
plot(BivData)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)
points(result$Huber, col = "orange", pch = 17)

# Options for the underlying projdepth routine may be passed 
# using the options argument. 
result <- projmedian(x = BivData,
                     options = list(type = "Affine",
                                    ndir = 10,
                                    stand = "MedMad",
                                    h = nrow(BivData)
                                    )
                    )
plot(BivData)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)
points(result$Huber, col = "orange", pch = 17)

# One may also calculate the depths of the points in the data
# separately. This avoids having to recompute the depths when these
# are previously calculated. 
depth.result <- projdepth(x = BivData)
result <- projmedian(x = BivData, 
                     projection.depths = depth.result$depthX)




