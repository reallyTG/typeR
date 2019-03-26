library(newTestSurvRec)


### Name: Qsearch.Fractil
### Title: Calculate the survival time to a selected quantile
### Aliases: Qsearch.Fractil
### Keywords: Quantile Survival

### ** Examples
XL<-data(MMC.TestSurvRec)
fit<-FitSurvRec(Survrecu(id,time,event)~1,data=MMC.TestSurvRec)
# 35th percentile from the survival function
Qsearch.Fractil(fit,q=0.35)
	 


