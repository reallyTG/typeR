library(chemometrics)


### Name: pcaCV
### Title: Determine the number of PCA components with repeated cross
###   validation
### Aliases: pcaCV
### Keywords: multivariate

### ** Examples

data(glass)
x.sc <- scale(glass)
resv <- clvalidity(x.sc,clnumb=c(2:5))



