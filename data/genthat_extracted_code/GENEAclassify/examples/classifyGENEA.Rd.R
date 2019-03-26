library(GENEAclassify)


### Name: classifyGENEA
### Title: Classify Data into Categories defined in an rpart GENEA fit
### Aliases: classifyGENEA

### ** Examples

## segData <- read.csv(system.file(package = "GENEAclassify", 
##       "data", "trainingData9.csv"))
## The training fit can be created by provided the file path to the training data
## in the function getTrainingData - see the help file for more details
## Uses the fitted decision tree to predict the segmented data
## class9 <- classifyGENEA(newdata = segData, outputname = NULL)
## head(class9)
## table(class9$Class)



