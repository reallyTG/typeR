library(shotGroups)


### Name: getHoytParam
### Title: Determine parameters q and omega of the Hoyt distribution
### Aliases: getHoytParam getHoytParam.data.frame getHoytParam.matrix
###   getHoytParam.list getHoytParam.default

### ** Examples

## q and omega based on coordinates in a data frame
getHoytParam(DFscar17)

## q and omega based on a covariance matrix
cm1 <- cbind(c(8, 0), c(0, 2))
getHoytParam(cm1)

## q and omega based on a list of covariance matrices
cm2 <- cbind(c(6, 0), c(0, 4))
cmL <- list(cm1, cm2)
getHoytParam(cmL)

## q and omega based on eigenvalues
ev <- eigen(cm1)$values
getHoytParam(cm1)



