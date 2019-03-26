library(ddalpha)


### Name: ddalpha.getErrorRateCV
### Title: Test DD-Classifier
### Aliases: ddalpha.getErrorRateCV
### Keywords: benchmark

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 200 training objects and 200 to test with
class1 <- mvrnorm(150, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(150, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
propertyVars <- c(1:2)
classVar <- 3
data <- rbind(cbind(class1, rep(1, 150)), cbind(class2, rep(2, 150)))

# Train 1st DDalpha-classifier (default settings) 
# and get the classification error rate
stat <- ddalpha.getErrorRateCV(data, numchunks = 5)
cat("1. Classification error rate (defaults): ", 
    stat$error, ".\n", sep = "")

# Train 2nd DDalpha-classifier (zonoid depth, maximum Mahalanobis 
# depth classifier with defaults as outsider treatment) 
# and get the classification error rate
stat2 <- ddalpha.getErrorRateCV(data, depth = "zonoid", 
                          outsider.methods = "depth.Mahalanobis")
cat("2. Classification error rate (depth.Mahalanobis): ", 
    stat2$error, ".\n", sep = "")





