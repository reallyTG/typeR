library(sgee)


### Name: hisee
### Title: Hierarchical Stagewise Estimating Equations Implementation.
### Aliases: hisee hisee hisee.formula hisee.default hisee.fit

### ** Examples


#####################
## Generate test data
#####################

## Initialize covariate values
p <- 50 
beta <- c(rep(2,5),
          c(1, 0, 1.5, 0, .5),
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
                         intercept = 1)

## Perform Fitting by providing y and x values
coefMat1 <- hisee(y = generatedData$y, x = generatedData$x,
                  family = gaussian(),
                  clusterID = generatedData$clusterID,
                  groupID = generatedData$groupID, 
                  corstr="exchangeable", 
                  control = sgee.control(maxIt = 50, epsilon = 0.5))
 
## Perform Fitting by providing formula and data
genDF <- data.frame(generatedData$y, generatedData$x)
names(genDF) <- c("Y", paste0("Cov", 1:p))
coefMat2 <- hisee(formula(genDF), data = genDF,
                  family = gaussian(),
                  subset = Y<1,
                  waves = rep(1:4, 50),
                  clusterID = generatedData$clusterID,
                  groupID = generatedData$groupID, 
                  corstr="exchangeable", 
                  control = sgee.control(maxIt = 50, epsilon = 0.5))
 
par(mfrow = c(2,1))
plot(coefMat1)
plot(coefMat2)




