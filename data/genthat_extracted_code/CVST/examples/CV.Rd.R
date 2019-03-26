library(CVST)


### Name: CV
### Title: Perform a k-fold Cross-validation
### Aliases: CV

### ** Examples

ns = noisySine(100)
svm = constructSVMLearner()
params = constructParams(kernel="rbfdot", sigma=10^(-3:3), nu=c(0.05, 0.1, 0.2, 0.3))
opt = CV(ns, svm, params)



