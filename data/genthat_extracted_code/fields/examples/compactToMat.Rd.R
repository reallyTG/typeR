library(fields)


### Name: compactToMat
### Title: Convert Matrix from Compact Vector to Standard Form
### Aliases: compactToMat
### Keywords: compact matrix

### ** Examples

################
#Calculate distance matrix from compact form:
################

#make a distance matrix
distOut = rdist(1:5, compact=TRUE)
print(distOut)

#note that distOut is in compact form:
print(c(distOut))

#convert to standard matrix form:
distMat = compactToMat(distOut)

################
#fast computation of covariance matrix:
################

#generate 5 random points on [0,1]x[0,1] square
x = matrix(runif(10), nrow=5)

#get compact distance matrix
distOut = rdist(x, compact=TRUE)

#evaluate Exponential covariance with range=1.  Note that
#Covariance function is only evaluated over upper triangle
#so time is saved.
diagVal = Exponential(0, range=1)
compactCovMat = Exponential(distOut, range=1)
upperCovMat = compactToMat(compactCovMat, diagVal)
lowerCovMat = compactToMat(compactCovMat, diagVal, lower.tri=TRUE, upper.tri=FALSE)
fullCovMat = compactToMat(compactCovMat, diagVal, lower.tri=TRUE, upper.tri=TRUE)
compactCovMat
lowerCovMat
upperCovMat
fullCovMat



