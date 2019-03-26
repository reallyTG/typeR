library(CVST)


### Name: CVST-package
### Title: Fast Cross-Validation via Sequential Testing
### Aliases: CVST-package CVST
### Keywords: package

### ** Examples

ns = noisySine(100)
svm = constructSVMLearner()
params = constructParams(kernel="rbfdot", sigma=10^(-3:3), nu=c(0.05, 0.1, 0.2, 0.3))
opt = fastCV(ns, svm, params, constructCVSTModel())



