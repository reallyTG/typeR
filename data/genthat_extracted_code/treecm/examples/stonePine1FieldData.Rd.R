library(treecm)


### Name: stonePine1FieldData
### Title: Raw CSV file of field recorded values for a stone pine tree
### Aliases: stonePine1FieldData
### Keywords: datasets

### ** Examples

library("treecm")
csvFileName <- system.file("data", "stonePine1FieldData.csv.gz", package = "treecm")
treeData <- importFieldData(
  csvFileName, 
  650, 
  allometryABDC
)
head(treeData$fieldData)



