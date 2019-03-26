library(newTestSurvRec)


### Name: newTestSurvRec-package
### Title: package newTestSurvRec
### Aliases: newTestSurvRec-package newTestSurvRec
### Keywords: package

### ** Examples
##library(newTestSurvRec)
getOption("defaultPackages")
XL<-data(TBCplapyr)
XL
Plot.Event.Rec(TBCplapyr)
Dif.Surv.Rec(TBCplapyr,'all',1,1,0,0)
Print.Summary(TBCplapyr)



