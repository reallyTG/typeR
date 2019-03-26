library(WiSEBoot)


### Name: WiSEConfidenceRegion
### Title: WiSE Wavelet Coefficients: Linear Confidence Region
### Aliases: WiSEConfidenceRegion
### Keywords: distributions htest nonparametric

### ** Examples

## R=10 bootstrap samples is not recommended. For demonstration only.


###Example with random data
x <- rnorm(2^8)
y <- x + rnorm(2^8, sd=0.001) #y has similar structure to x
xWise <- WiSEBoot(x, R=10, J0=4)
yWise <- WiSEBoot(y, R=10, J0=4)
xyConf <- WiSEConfidenceRegion(xWise, yWise) #does the region contain (0, 1)?


###Example with AIRS and IPSL data
data(CM20N20S60E)
padCM <- padMatrix(CM20N20S60E)  #pad data so we can use wavelet methodology

AIRS <- WiSEBoot(padCM$xPad[,1], R=10, J0=5, XParam=padCM$linearParam[,1])
IPSL1 <- WiSEBoot(padCM$xPad[,2], R=10, J0=5, XParam=padCM$linearParam[,2])

AIRS_IPSL1Conf <- WiSEConfidenceRegion(AIRS, IPSL1) #how are these signals related?



