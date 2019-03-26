library(sgee)


### Name: sgee-package
### Title: sgee: Stagewise Generalized Estimating Equations
### Aliases: sgee-package sgee

### ** Examples




#####################
## Generate test data
#####################

## Initialize covariate values
p <- 50 
beta <- c(rep(2.4,5),
          c(1.2, 0, 1.6, 0, .4),
          rep(0.5,5),
          rep(0,p-15))
groupSize <- 5
numGroups <- length(beta)/groupSize


generatedData <- genData(numClusters = 50,
                         clusterSize = 4,
                         clusterRho = 0.6,
                         clusterCorstr = "exchangeable",
                         yVariance = 1,
                         xVariance = 1,
                         numGroups = numGroups,
                         groupSize = groupSize,
                         groupRho = 0.3,
                         beta = beta,
                         family = gaussian(),
                         intercept = 0)


coefMat1 <- hisee(y = generatedData$y, x = generatedData$x,
                  family = gaussian(),
                  clusterID = generatedData$clusterID,
                  groupID = generatedData$groupID, 
                  corstr="exchangeable",
                  control = sgee.control(maxIt = 100, epsilon = 0.2))

## interceptLimit allows for compatibility with older R versions
coefMat2 <- bisee(y = generatedData$y, x = generatedData$x,
                  family = gaussian(),
                  clusterID = generatedData$clusterID,
                  groupID = generatedData$groupID, 
                  corstr="exchangeable", 
                  control = sgee.control(maxIt = 100, epsilon = 0.2,
                                         interceptLimit = 10),
                  lambda1 = .5,
                  lambda2 = .5)


par(mfrow = c(2,1))
plot(coefMat1)
plot(coefMat2)




