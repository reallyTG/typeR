library(ddalpha)


### Name: is.in.convex
### Title: Check Outsiderness
### Aliases: is.in.convex
### Keywords: multivariate

### ** Examples

# Generate a bivariate normal location-shift classification task
# containing 400 training objects and 1000 to test with
class1 <- mvrnorm(700, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(700, c(2,2), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
trainIndices <- c(1:200)
testIndices <- c(201:700)
propertyVars <- c(1:2)
classVar <- 3
trainData <- rbind(cbind(class1[trainIndices,], rep(1, 200)), 
                   cbind(class2[trainIndices,], rep(2, 200)))
testData <- rbind(cbind(class1[testIndices,], rep(1, 500)), 
                  cbind(class2[testIndices,], rep(2, 500)))
data <- list(train = trainData, test = testData)

# Count outsiders
numOutsiders = sum(rowSums(is.in.convex(data$test[,propertyVars], 
                                data$train[,propertyVars], c(200, 200))) == 0)
cat(numOutsiders, "outsiders found in the testing sample.\n")



