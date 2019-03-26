library(dimRed)


### Name: dataSets
### Title: Example Data Sets for dimensionality reduction
### Aliases: dataSets loadDataSet dataSetList

### ** Examples

## a list of available data sets:
dataSetList()

## Load a data set:
swissRoll <- loadDataSet("Swiss Roll")
## No test: 
plot(swissRoll, type = "3vars")
## End(No test)

## Load Iris data set, partial matching:
loadDataSet("I")




