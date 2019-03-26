library(sgee)


### Name: see
### Title: Stagewise Estimating Equations Implementation
### Aliases: see see see.formula see.default see.fit

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
groupSize <- 1
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



## Perform Fitting by providing formula and data
genDF <- data.frame(generatedData$y, generatedData$x)
names(genDF) <- c("Y", paste0("Cov", 1:p))
coefMat1 <- see(formula(genDF), data = genDF,
                 family = gaussian(),
                 waves = rep(1:4, 50), 
                 clusterID = generatedData$clusterID,
                 groupID = generatedData$groupID, 
                 corstr = "exchangeable",
                 control = sgee.control(maxIt = 50, epsilon = 0.5),
                 verbose = TRUE)

## set parameter 'stochastic' to 0.5 to implement the stochastic
## stagewise approach where a subsmaple of 50% of the data is taken
## before the path is calculation.
## See sgee.control for more details about the parameters for the
## stochastic stagewise approach

coefMat2 <- see(formula(genDF), data = genDF,
                 family = gaussian(),
                 waves = rep(1:4, 50), 
                 clusterID = generatedData$clusterID,
                 groupID = generatedData$groupID, 
                 corstr = "exchangeable",
                 control = sgee.control(maxIt = 50, epsilon = 0.5,
                                        stochastic = 0.5), 
                 verbose = FALSE)

par(mfrow = c(2,1))
plot(coefMat1)
plot(coefMat2)




