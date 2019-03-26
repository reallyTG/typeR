library(sgee)


### Name: plot.sgee
### Title: Coefficient Traceplot Function
### Aliases: plot.sgee plot.sgeeSummary

### ** Examples



#####################
## Generate test data
#####################

## Initialize covariate values
p <- 50 
beta <- c(rep(2.4,5),
          c(1.3, 0, 1.7, 0, .5),
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
                         intercept = 0)

genDF <- data.frame(generatedData$y, generatedData$x)
coefMat <- bisee(formula(genDF),
                 data = genDF,
                 lambda1 = 0,         ##effectively see
                 lambda2 = 1,
                 family = gaussian(),
                 clusterID = generatedData$clusterID, 
                 corstr="exchangeable", 
                 maxIt = 200,
                 epsilon = .1)
############################
## Various options for plots
############################

par(mfrow = c(2,2))

## plain useage
plot(coefMat, main = "Plain Usage")

## With penalty
plot(coefMat, penaltyFun = function(x){sum(abs(x))}, xlab
= expression(abs(abs(beta))[1]), main = "With Penalty")

## using true beta value to highlight misclassifications
plot(coefMat, trueBeta = beta, main = "ID Missclassification")

## black and white option
plot(coefMat, trueBeta = beta, color = FALSE, main =
"Black and White", pointSpacing = 5)






