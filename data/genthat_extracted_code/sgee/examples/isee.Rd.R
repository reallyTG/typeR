library(sgee)


### Name: isee
### Title: Interaction stagewise estimating equations
### Aliases: isee isee isee.formula isee.default acts.fit hila.fit

### ** Examples


#####################
## Generate test data
#####################

## Initialize covariate values
p <- 5 
beta <- c(1, 0, 1.5, 0, .5, ## Main effects
          rep(0.5,4), ## Interaction terms
          0.5, 0, 0.5,
          0,1,
          0)


generatedData <- genData(numClusters = 50,
                         clusterSize = 4,
                         clusterRho = 0.6,
                         clusterCorstr = "exchangeable",
                         yVariance = 1,
                         xVariance = 1,
                         beta = beta,
                         numMainEffects = p,
                         family = gaussian(),
                         intercept = 1)

 
## Perform Fitting by providing formula and data
genDF <- data.frame(Y = generatedData$y, X = generatedData$xMainEff)

## Using "ACTS" method
coefMat1 <- isee(formula(paste0("Y~(",
                               paste0("X.", 1:p, collapse = "+"),
                                 ")^2")),
                  data = genDF,
                  family = gaussian(),
                  clusterID = generatedData$clusterID,
                  corstr = "exchangeable",
                  method = "ACTS",
                  control = sgee.control(maxIt = 50, epsilon = 0.5))

## Using "HiLa" method
coefMat2 <- isee(formula(paste0("Y~(",
                               paste0("X.", 1:p, collapse = "+"),
                                 ")^2")),
                  data = genDF,
                  family = gaussian(),
                  clusterID = generatedData$clusterID,
                  corstr = "exchangeable",
                  method = "HiLa",
                  control = sgee.control(maxIt = 50, epsilon = 0.5))




