library(GENEAclassify)


### Name: createGENEAmodel
### Title: Create training data decision tree model
### Aliases: createGENEAmodel

### ** Examples

## dataPath <- file.path(system.file(package = "GENEAclassify"), 
##    "testdata", "trainingData2.csv")
## t1 <- read.csv(file = dataPath)
## f1 <- createGENEAmodel (data = t1, 
##     features = c("Magnitude.mean", "Degrees.var", "UpDown.mad"))
## class(f1)
## levels(f1)
## features(f1)
## plot(f1)
## text(f1)



