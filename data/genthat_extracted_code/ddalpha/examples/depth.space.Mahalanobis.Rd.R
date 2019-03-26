library(ddalpha)


### Name: depth.space.Mahalanobis
### Title: Calculate Depth Space using Mahalanobis Depth
### Aliases: depth.space.Mahalanobis
### Keywords: robust multivariate nonparametric

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(10, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(10, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
# Get depth space using Mahalanobis depth
depth.space.Mahalanobis(data, c(10, 10))
depth.space.Mahalanobis(data, c(10, 10), mah.estimate = "MCD", mah.parMcd = 0.75)

data <- getdata("hemophilia")
cardinalities = c(sum(data$gr == "normal"), sum(data$gr == "carrier"))
depth.space.Mahalanobis(data[,1:2], cardinalities)



