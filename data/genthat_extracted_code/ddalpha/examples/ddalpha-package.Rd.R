library(ddalpha)


### Name: ddalpha-package
### Title: Depth-Based Classification and Calculation of Data Depth
### Aliases: ddalpha-package ddalpha
### Keywords: package robust multivariate functional nonparametric classif

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

# Train the DDalpha-classifier
ddalpha <- ddalpha.train(data$train)

# Classify by means of DDalpha-classifier
classes <- ddalpha.classify(ddalpha, data$test[,propertyVars])
cat("Classification error rate:", 
    sum(unlist(classes) != data$test[,classVar])/200, "\n")

# Calculate zonoid depth of top 10 testing objects w.r.t. 1st class
depths.zonoid <- depth.zonoid(data$test[1:10,propertyVars], 
                              data$train[trainIndices,propertyVars])
cat("Zonoid depths:", depths.zonoid, "\n")

# Calculate the random Tukey depth of top 10 testing objects w.r.t. 1st class
depths.halfspace <- depth.halfspace(data$test[1:10,propertyVars], 
                                        data$train[trainIndices,propertyVars])
cat("Random Tukey depths:", depths.halfspace, "\n")

# Calculate depth space with zonoid depth
dspace.zonoid <- depth.space.zonoid(data$train[,propertyVars], c(100, 100))

# Calculate depth space with the exact Tukey depth
dspace.halfspace <- depth.space.halfspace(data$train[,propertyVars], c(100, 100), exact = TRUE)

# Count outsiders
numOutsiders = sum(rowSums(is.in.convex(data$test[,propertyVars], 
                                data$train[,propertyVars], c(100, 100))) == 0)
cat(numOutsiders, "outsiders found in the testing sample.\n")



