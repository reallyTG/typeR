library(ddalpha)


### Name: ddalpha.classify
### Title: Classify using DD-Classifier
### Aliases: ddalpha.classify predict.ddalpha
### Keywords: robust multivariate nonparametric classif

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

# Train the DDalpha-Classifier (zonoid depth, maximum Mahalanobis depth 
# classifier with defaults as outsider treatment)
ddalpha <- ddalpha.train(data$train, 
                         depth = "zonoid", 
                         outsider.methods = "depth.Mahalanobis")
# Get the classification error rate
classes <- ddalpha.classify(data$test[,propertyVars], ddalpha, 
                            outsider.method = "depth.Mahalanobis")
cat("Classification error rate: ", 
    sum(unlist(classes) != data$test[,classVar])/200, ".\n", sep="")



