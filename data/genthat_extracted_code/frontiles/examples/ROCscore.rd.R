library(frontiles)


### Name: ROCscore
### Title: The ROC curve to help choosing alpha and m parameters
### Aliases: ROCscore
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
res.roc<-ROCscore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]),
type="output")



