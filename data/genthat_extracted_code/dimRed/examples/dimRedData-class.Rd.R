library(dimRed)


### Name: dimRedData-class
### Title: Class "dimRedData"
### Aliases: dimRedData-class dimRedData as.data.frame,dimRedData-method
###   as.dimRedData,formula-method getData,dimRedData-method
###   getMeta,dimRedData-method nrow,dimRedData-method
###   [,dimRedData,ANY,ANY,ANY-method ndims,dimRedData-method

### ** Examples

## Load an example data set:
s3d <- loadDataSet("3D S Curve")

## Create using a constructor:

### without meta information:
dimRedData(iris[, 1:4])

### with meta information:
dimRedData(iris[, 1:4], iris[, 5])

### using slot names:
dimRedData(data = iris[, 1:4], meta = iris[, 5])

## Convert to a dimRedData objects:
Iris <- as(iris[, 1:4], "dimRedData")

## Convert to data.frame:
head(as(s3d, "data.frame"))
head(as.data.frame(s3d))
head(as.data.frame(as(iris[, 1:4], "dimRedData")))

## Extract slots:
head(getData(s3d))
head(getMeta(s3d))

## Get the number of observations:
nrow(s3d)

## Subset:
s3d[1:5, ]

## create a dimRedData object using a formula
as.dimRedData(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
              iris)[1:5]

## Shuffle data:
s3 <- s3d[nrow(s3d)]

## Get the number of variables:
ndims(s3d)




