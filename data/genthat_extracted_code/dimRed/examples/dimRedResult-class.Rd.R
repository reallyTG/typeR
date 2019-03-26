library(dimRed)


### Name: dimRedResult-class
### Title: Class "dimRedResult"
### Aliases: dimRedResult-class dimRedResult predict,dimRedResult-method
###   inverse,dimRedResult-method inverse as.data.frame,dimRedResult-method
###   getPars,dimRedResult-method print,dimRedResult-method
###   getOrgData,dimRedResult-method getDimRedData,dimRedResult-method
###   ndims,dimRedResult-method

### ** Examples

## Create object by embedding data
iris.pca <- embed(loadDataSet("Iris"), "PCA")

## Convert the result to a data.frame
head(as(iris.pca, "data.frame"))
head(as.data.frame(iris.pca))

## There are no nameclashes to avoid here:
head(as.data.frame(iris.pca,
                   org.data.prefix = "",
                   meta.prefix     = "",
                   data.prefix     = ""))

## Print it more or less nicely:
print(iris.pca)

## Get the embedded data as a dimRedData object:
getDimRedData(iris.pca)

## Get the original data including meta information:
getOrgData(iris.pca)

## Get the number of variables:
ndims(iris.pca)




