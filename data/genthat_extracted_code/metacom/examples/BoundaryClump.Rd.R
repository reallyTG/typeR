library(metacom)


### Name: BoundaryClump
### Title: Determines boundary clumping
### Aliases: BoundaryClump

### ** Examples


data(TestMatrices)
intmat <- TestMatrices[[1]]
bound.test <- BoundaryClump(intmat, order=TRUE, scores=1, 
binary=TRUE, fill=TRUE)
bound.test



