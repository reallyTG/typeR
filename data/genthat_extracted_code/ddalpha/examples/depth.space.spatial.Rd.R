library(ddalpha)


### Name: depth.space.spatial
### Title: Calculate Depth Space using Spatial Depth
### Aliases: depth.space.spatial
### Keywords: robust multivariate nonparametric

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(10, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(10, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
# Get depth space using spatial depth
depth.space.spatial(data, c(10, 10))

data <- getdata("hemophilia")
cardinalities = c(sum(data$gr == "normal"), sum(data$gr == "carrier"))
depth.space.spatial(data[,1:2], cardinalities)



