library(treecm)


### Name: stonePine1TreeData
### Title: Field recorded values for a stone pine tree
### Aliases: stonePine1TreeData
### Keywords: datasets

### ** Examples

data(stonePine1TreeData)
vectors  <- treeVectors(stonePine1TreeData)
CM       <- centreOfMass(vectors)
summary(CM)
# The steps to recreate this dataset:
csvFileName <- system.file("data", "stonePine1FieldData.csv.gz", package = "treecm")
treeData <- importFieldData(csvFileName, 650, allometryABDC)
treeData <- treeBiomass(treeData)



