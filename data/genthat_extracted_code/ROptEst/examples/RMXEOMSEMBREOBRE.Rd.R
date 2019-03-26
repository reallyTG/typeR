library(ROptEst)


### Name: RMXEOMSEMBREOBRE
### Title: Optimally robust estimation: RMXE, OMSE, MBRE, and OBRE
### Aliases: RMXEstimator OMSEstimator OBREstimator MBREstimator
### Keywords: robust

### ** Examples

#############################
## 1. Binomial data
#############################
## generate a sample of contaminated data
set.seed(123)
ind <- rbinom(100, size=1, prob=0.05)
x <- rbinom(100, size=25, prob=(1-ind)*0.25 + ind*0.9)

## ML-estimate
MLE.bin <- MLEstimator(x, BinomFamily(size = 25))
## compute optimally robust estimators
OMSE.bin <- OMSEstimator(x, BinomFamily(size = 25), steps = 3)
MBRE.bin <- MBREstimator(x, BinomFamily(size = 25), steps = 3)
estimate(MLE.bin)
estimate(MBRE.bin)
estimate(OMSE.bin)

## No test: 
  ## to reduce time load at CRAN tests
RMXE.bin <- RMXEstimator(x, BinomFamily(size = 25), steps = 3)
OBRE.bin <- OBREstimator(x, BinomFamily(size = 25), steps = 3)
estimate(RMXE.bin)
estimate(OBRE.bin)
## End(No test)
## No test: 
  ## to reduce time load at CRAN tests
#############################
## 2. Poisson data
#############################

## Example: Rutherford-Geiger (1910); cf. Feller~(1968), Section VI.7 (a)
x <- c(rep(0, 57), rep(1, 203), rep(2, 383), rep(3, 525), rep(4, 532),
       rep(5, 408), rep(6, 273), rep(7, 139), rep(8, 45), rep(9, 27),
       rep(10, 10), rep(11, 4), rep(12, 0), rep(13, 1), rep(14, 1))

## ML-estimate
MLE.pois <- MLEstimator(x, PoisFamily())
OBRE.pois <- OBREstimator(x, PoisFamily(), steps = 3)
OMSE.pois <- OMSEstimator(x, PoisFamily(), steps = 3)
MBRE.pois <- MBREstimator(x, PoisFamily(), steps = 3)
RMXE.pois <- RMXEstimator(x, PoisFamily(), steps = 3)
estimate(MLE.pois)
estimate(OBRE.pois)
estimate(RMXE.pois)
estimate(MBRE.pois)
estimate(OMSE.pois)
## End(No test)

## No test: 
 ## to reduce time load at CRAN tests
#############################
## 3. Normal (Gaussian) location and scale
#############################
## 24 determinations of copper in wholemeal flour
library(MASS)
data(chem)

MLE.n <- MLEstimator(chem, NormLocationScaleFamily())
MBRE.n <- MBREstimator(chem, NormLocationScaleFamily(), steps = 3)
OMSE.n <- OMSEstimator(chem, NormLocationScaleFamily(), steps = 3)
OBRE.n <- OBREstimator(chem, NormLocationScaleFamily(), steps = 3)
RMXE.n <- RMXEstimator(chem, NormLocationScaleFamily(), steps = 3)

estimate(MLE.n)
estimate(MBRE.n)
estimate(OMSE.n)
estimate(OBRE.n)
estimate(RMXE.n)
## End(No test)



