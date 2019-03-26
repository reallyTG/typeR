library(ddalpha)


### Name: ddalpha.test
### Title: Test DD-Classifier
### Aliases: ddalpha.test
### Keywords: benchmark

### ** Examples


# Generate a bivariate normal location-shift classification task
# containing 200 training objects and 200 to test with
class1 <- mvrnorm(200, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(200, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
trainIndices <- c(1:100)
testIndices <- c(101:200)
propertyVars <- c(1:2)
classVar <- 3
trainData <- rbind(cbind(class1[trainIndices,], rep(1, 100)), 
                   cbind(class2[trainIndices,], rep(2, 100)))
testData <- rbind(cbind(class1[testIndices,], rep(1, 100)), 
                  cbind(class2[testIndices,], rep(2, 100)))
data <- list(train = trainData, test = testData)

# Train 1st DDalpha-classifier (default settings) 
# and get the classification error rate
stat <- ddalpha.test(data$train, data$test)
cat("1. Classification error rate (defaults): ", 
    stat$error, ".\n", sep = "")

# Train 2nd DDalpha-classifier (zonoid depth, maximum Mahalanobis 
# depth classifier with defaults as outsider treatment) 
# and get the classification error rate
stat2 <- ddalpha.test(data$train, data$test, depth = "zonoid", 
                          outsider.methods = "depth.Mahalanobis")
cat("2. Classification error rate (depth.Mahalanobis): ", 
    stat2$error, ".\n", sep = "")




