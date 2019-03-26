library(ddalpha)


### Name: depth.space.projection
### Title: Calculate Depth Space using Projection Depth
### Aliases: depth.space.projection
### Keywords: robust multivariate nonparametric

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(10, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(10, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
# Get depth space using projection depth
depth.space.projection(data, c(10, 10), method = "random", num.directions = 1000)
depth.space.projection(data, c(10, 10), method = "linearize")

data <- getdata("hemophilia")
cardinalities = c(sum(data$gr == "normal"), sum(data$gr == "carrier"))
depth.space.projection(data[,1:2], cardinalities)



