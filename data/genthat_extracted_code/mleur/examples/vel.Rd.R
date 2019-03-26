library(mleur)


### Name: vel
### Title: Velocity of money, 1869-1970, Nelson
### Aliases: vel
### Keywords: datasets

### ** Examples

#Example 1: Data source:
data(nporg, package="urca")
testdata <- na.omit(nporg[, c("year", "vel")])
vel <- ts(testdata[,"vel"], start=testdata[1,1], freq=1)
#
mleurDiag(vel)
dftest(vel)
mleur(vel)



