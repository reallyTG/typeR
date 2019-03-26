library(sgee)


### Name: summary.sgee
### Title: Coefficient Path summary
### Aliases: summary.sgee

### ** Examples


## Initialize covariate values
p <- 50 
beta <- c(rep(2.4,5),
          c(1.3, 0, 1.7, 0, .5),
          rep(0.5,5),
          rep(0,p-15))
groupSize <- 1
numGroups <- length(beta)/groupSize



trainingData <- genData(numClusters = 50,
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
                        intercept = 1)

testingData <- genData(numClusters = 50,
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
                       intercept = 1)

coefMat <- see(y = trainingData$y,
               x = trainingData$x,
                    family = gaussian(),
                    clusterID = trainingData$clusterID, 
                    corstr="exchangeable", 
                    maxIt = 200,
                    epsilon = .1)

analysisResults <- summary(coefMat,
                           newX = testingData$x,
                           newY = testingData$y)





