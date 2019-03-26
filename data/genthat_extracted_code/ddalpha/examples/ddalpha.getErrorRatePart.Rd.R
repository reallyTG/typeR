library(ddalpha)


### Name: ddalpha.getErrorRatePart
### Title: Test DD-Classifier
### Aliases: ddalpha.getErrorRatePart
### Keywords: benchmark

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 200 objects
class1 <- mvrnorm(100, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(100, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
propertyVars <- c(1:2)
classVar <- 3
data <- rbind(cbind(class1, rep(1, 100)), cbind(class2, rep(2, 100)))

# Train 1st DDalpha-classifier (default settings) 
# and get the classification error rate
stat <- ddalpha.getErrorRatePart(data, size = 10, times = 10)
cat("1. Classification error rate (defaults): ", 
    stat$error, ".\n", sep = "")

# Train 2nd DDalpha-classifier (zonoid depth, maximum Mahalanobis 
# depth classifier with defaults as outsider treatment) 
# and get the classification error rate
stat2 <- ddalpha.getErrorRatePart(data, depth = "zonoid", 
                                outsider.methods = "depth.Mahalanobis", size = 0.2, times = 10)
cat("2. Classification error rate (depth.Mahalanobis): ", 
    stat2$error, ".\n", sep = "")






