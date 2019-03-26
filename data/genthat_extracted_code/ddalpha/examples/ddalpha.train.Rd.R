library(ddalpha)


### Name: ddalpha.train
### Title: Train DD-Classifier
### Aliases: ddalpha.train alpha polynomial knnlm maxD outsiders
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

# Train 1st DDalpha-classifier (default settings) 
# and get the classification error rate
ddalpha1 <- ddalpha.train(data$train)
classes1 <- ddalpha.classify(ddalpha1, data$test[,propertyVars])
cat("1. Classification error rate (defaults): ", 
    sum(unlist(classes1) != data$test[,classVar])/200, ".\n", sep = "")

# Train 2nd DDalpha-classifier (zonoid depth, maximum Mahalanobis 
# depth classifier with defaults as outsider treatment) 
# and get the classification error rate
ddalpha2 <- ddalpha.train(data$train, depth = "zonoid", 
                          outsider.methods = "depth.Mahalanobis")
classes2 <- ddalpha.classify(ddalpha2, data$test[,propertyVars], 
                               outsider.method = "depth.Mahalanobis")
cat("2. Classification error rate (depth.Mahalanobis): ", 
    sum(unlist(classes2) != data$test[,classVar])/200, ".\n", sep = "")

# Train 3rd DDalpha-classifier (100 random directions for the Tukey depth, 
# adjusted maximum Mahalanobis depth classifier 
# and equal randomization as outsider treatments) 
# and get the classification error rates
treatments <- list(list(name = "mahd1", method = "depth.Mahalanobis", 
                        mah.estimate = "MCD", mcd.alpha = 0.75, priors = c(1, 1)/2), 
                   list(name = "rand1", method = "RandEqual"))
ddalpha3 <- ddalpha.train(data$train, outsider.settings = treatments, 
                          num.direction = 100)
classes31 <- ddalpha.classify(ddalpha3, data$test[,propertyVars], 
                              outsider.method = "mahd1")
classes32 <- ddalpha.classify(ddalpha3, data$test[,propertyVars], 
                              outsider.method = "rand1")
cat("3. Classification error rate (by treatments):\n")
cat("   Error (mahd1): ", 
    sum(unlist(classes31) != data$test[,classVar])/200, ".\n", sep = "")
cat("   Error (rand1): ", 
    sum(unlist(classes32) != data$test[,classVar])/200, ".\n", sep = "")
    
# Train using some weird formula
ddalpha = ddalpha.train(
    I(mpg >= 19.2) ~ log(disp) + I(disp^2) + disp + I(disp * drat),
    data = mtcars, subset = (carb!=1), 
    depth = "Mahalanobis", separator = "alpha")
print(ddalpha) # make sure that the resulting table is what you wanted
CC = ddalpha.classify(ddalpha, mtcars)
sum((mtcars$mpg>=19.2)!= unlist(CC))/nrow(mtcars) # error rate
    
#Use the pre-calculated DD-plot
data = cbind(rbind(mvrnorm(n = 50, mu = c(0,0), Sigma = diag(2)),
                   mvrnorm(n = 50, mu = c(5,10), Sigma = diag(2)),
                   mvrnorm(n = 50, mu = c(10,0), Sigma = diag(2))),
             rep(c(1,2,3), each = 50))
plot(data[,1:2], col = (data[,3]+1))

ddplot = depth.space.Mahalanobis(data = data[,1:2], cardinalities = c(50,50,50))
ddplot = cbind(ddplot, data[,3])
ddalphaD = ddalpha.train(data = ddplot, depth = "ddplot", separator = "alpha")
c = ddalpha.classify(ddalphaD, ddplot[,1:3])
errors = sum(unlist(c) != data[,3])/nrow(data)
print(paste("Error rate: ",errors))

ddalpha = ddalpha.train(data = data, depth = "Mahalanobis", separator = "alpha")
c = ddalpha.classify(ddalpha, data[,1:2])
errors = sum(unlist(c) != data[,3])/nrow(data)
print(paste("Error rate: ",errors))



