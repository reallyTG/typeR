library(sgee)


### Name: genData
### Title: Response and Covariate Data Generation
### Aliases: genData

### ** Examples



## A resonse variance can be given,
dat1 <- genData(numClusters = 10,
                clusterSize = 4,
                clusterRho = .5,
                clusterCorstr = "exchangeable",
                yVariance = 1,
                xVariance = 1,
                numGroups = 5,
                groupSize = 4,
                groupRho = .5,
                beta = c(rep(1,8), rep(0,12)),
                family = gaussian(),
                intercept = 1)

## or the signal to noise ratio can be fixed
dat2 <- genData(numClusters = 10,
                clusterSize = 4,
                clusterRho = .5,
                clusterCorstr = "exchangeable",
                xVariance = 1,
                numGroups = 5,
                groupSize = 4,
                groupRho = .5,
                beta = c(rep(1,8), rep(0,12)),
                family = poisson(),
                SNR = 10,
                intercept = 1)




