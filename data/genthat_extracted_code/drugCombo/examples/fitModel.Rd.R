library(drugCombo)


### Name: fitModel
### Title: Fit drug interaction index model according to Harbron's
###   framework
### Aliases: fitModel

### ** Examples

## No test: 
data("checkerboardData", package = "drugCombo")
data1 <- checkerboardData[checkerboardData$exp == 1, ]
mono1 <- fitMarginals(data1, fixed = c(b = 1))
# all three ways below are equivalent
fitLin1 <- fitModel(data = data1, mono = mono1, model = "linear1")
fitLin1b <- fitModel(data1, mono1, tauFormula = ~ log10(d1))
fitLin1c <- fitModel(data1, mono1, tauFormula = ~ tau1+tau2*log10(d1))
## End(No test)



