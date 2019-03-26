library(analogue)


### Name: getK
### Title: Extract and set the number of analogues
### Aliases: getK getK.default getK.mat getK.bootstrap.mat getK.predict.mat
###   setK<- setK<-.default setK<-.mat
### Keywords: utilities manip

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

## fit a MAT model
ik.mat <- mat(ImbrieKipp, SumSST, method = "chord")

## How many analogues gives lowest RMSE?
getK(ik.mat)
## note that this value was chosen automatically

## Now set k to be 10
setK(ik.mat) <- 10

## check
getK(ik.mat)




