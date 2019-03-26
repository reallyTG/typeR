library(WiSEBoot)


### Name: WiSEHypothesisTest
### Title: WiSE Wavelet Coefficients: Linear Hypothesis Test
### Aliases: WiSEHypothesisTest
### Keywords: distribution nonparametric htest

### ** Examples

##Test whether \alpha=0 and \beta=1 for AIRS and IPSL Run 1 at 60E
## R=10 bootstrap samples is not recommended.  For demonstration only.
data(CM20N20S60E)
padData <- padMatrix(CM20N20S60E)
hypTest <- WiSEHypothesisTest(padData$xPad[,1], padData$xPad[,2], J0=5, R=10, 
                              XParam=padData$linearParam[,1], YParam=padData$linearParam[,2], 
                              plot=TRUE)



