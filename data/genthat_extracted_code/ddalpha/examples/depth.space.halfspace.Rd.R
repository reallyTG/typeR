library(ddalpha)


### Name: depth.space.halfspace
### Title: Calculate Depth Space using Halfspace Depth
### Aliases: depth.space.halfspace
### Keywords: robust multivariate nonparametric

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(10, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(10, c(1,1), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
plot(data, col = c(rep(1,10), rep(2,10)))
# Get depth space using the random Tukey depth
dhA = depth.space.halfspace(data, c(10, 10))
(dhA)

# Get depth space using default exact method - "recursive"
dhE = depth.space.halfspace(data, c(10, 10), exact = TRUE)
(dhE)

data <- getdata("hemophilia")
cardinalities = c(sum(data$gr == "normal"), sum(data$gr == "carrier"))
depth.space.halfspace(data[,1:2], cardinalities)



