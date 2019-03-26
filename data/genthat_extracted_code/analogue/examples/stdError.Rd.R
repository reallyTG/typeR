library(analogue)


### Name: stdError
### Title: Standard error of MAT fitted and predicted values
### Aliases: stdError stdError.mat stdError.predict.mat
### Keywords: methods univar

### ** Examples

## Imbrie and Kipp Sea Surface Temperature
data(ImbrieKipp)
data(SumSST)
data(V12.122)

## merge training set and core samples
dat <- join(ImbrieKipp, V12.122, verbose = TRUE)

## extract the merged data sets and convert to proportions
ImbrieKipp <- dat[[1]] / 100
ImbrieKippCore <- dat[[2]] / 100

## fit the MAT model using the squared chord distance measure
ik.mat <- mat(ImbrieKipp, SumSST, method = "SQchord")

## standard errors - unweighted
stdError(ik.mat)
## standard errors - weighted version for above
stdError(ik.mat, k = getK(ik.mat), weighted = TRUE)

## standard errors - weighted; note this uses more (7) analogues
## than the above as this model had lowest LOO error
stdError(ik.mat, weighted = TRUE)

## reconstruct for the V12-122 core data
coreV12.mat <- predict(ik.mat, V12.122, k = 3)
## standard errors
stdError(coreV12.mat)



