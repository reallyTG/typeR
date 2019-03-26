library(treecm)


### Name: stonePine2FieldData
### Title: Raw CSV file of field recorded values for a stone pine tree
### Aliases: stonePine2FieldData
### Keywords: datasets

### ** Examples

library("treecm")
csvFileName <- system.file("data", "stonePine2FieldData.csv.gz", package = "treecm")
treeData <- importFieldData(csvFileName, 650, allometryABDC)
head(treeData$fieldData)



