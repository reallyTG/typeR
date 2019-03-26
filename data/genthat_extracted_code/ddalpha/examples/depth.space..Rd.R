library(ddalpha)


### Name: depth.space.
### Title: Calculate Depth Space using the Given Depth
### Aliases: depth.space.
### Keywords: robust multivariate nonparametric

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(10, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(10, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
# Get depth space using zonoid depth
depth.space.(data, c(10, 10), notion = "zonoid")



