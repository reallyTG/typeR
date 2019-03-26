library(DAAGxtras)


### Name: covsample
### Title: Sample of UCI Machine Learning Forest Cover Dataset
### Aliases: covsample
### Keywords: datasets

### ** Examples

data(covsample)
options(digits=3)
tab.sample <- table(covsample$V55)
tab.sample/sum(tab.sample)
rm(covsample)
data(covtrain)
tab.train <- table(covtrain$V55)
tab.train/sum(tab.train)
rm(covtrain)
data(covtest)
tab.test <- table(covtest$V55)
tab.test/sum(tab.test)
rm(covtest)



