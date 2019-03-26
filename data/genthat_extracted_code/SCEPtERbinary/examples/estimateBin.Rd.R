library(SCEPtERbinary)


### Name: estimateBin
### Title: Age estimates for the supplied binary systems
### Aliases: estimateBin
### Keywords: manip

### ** Examples

require(SCEPtER)
data(stdGrid)
ogrid <- stdGrid[ do.call(order, as.data.frame(stdGrid[,1])), ]

## observational constraint: Teff, [Fe/H], M, R
vsel <- c(1,0,1,0,0,1,1)
sigma <- c(100, 0.25, 0.1, 0.025, 0.05, 0.01, 0.005)

## syntetic sample of 10 bynary systems
bl <- block(stdGrid)
sam <- sampleBinStar(10, stdGrid, bl, restrict=TRUE)

## add Gaussian noise to the observations
starbp <- errorObsBin(sigma, sam)

resB <- estimateBin(ogrid, starbp, sigma, 3, vsel, parallel=FALSE)


## An observed system: PK Peg
## observation from Clausen et al. (2010). A&A, 516, A42.

obs <- c(6265,NA,-0.12,NA,NA,1.414,1.988,NA,NA, 6320,NA,-0.12,NA,NA,1.257,1.474,NA,NA)
sigma <- c(85,0,0.07,0,0,0.007/1.414,0.008/1.988, 90,0,0.07,0,0,0.005/1.257,0.017/1.474)

## for sensible estimate adopt at least nrow=10000
star <- matrix(obs, nrow=100, ncol=18, byrow=TRUE)

## add Gaussian noise
starp <- errorObsBin(sigma, star)

resB <- estimateBin(ogrid, starp, sigma, 3, vsel, parallel=FALSE)

quantile(resB$ageBin, c(0.16, 0.5, 0.84))



