library(newTestSurvRec)


### Name: is.Survrecu
### Title: This function verify if the formula type of survival recurrent
###   is object type newTestSurvRec
### Aliases: is.Survrecu
### Keywords: Tests Survival

### ** Examples
data(MMC.TestSurvRec)
x<-Survrecu(MMC.TestSurvRec$id,MMC.TestSurvRec$time,MMC.TestSurvRec$event)~1
is.Survrecu(x)



