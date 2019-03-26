library(needmining)


### Name: readNeedminingFile
### Title: Read Tweet file
### Aliases: readNeedminingFile

### ** Examples

data(NMTrainingData)
saveNeedminingFile(filename=file.path(tempdir(), "NMTrainingData.csv"),
NMTrainingData)
currentNeedData <- readNeedminingFile(file.path(tempdir(), "NMTrainingData.csv"))



