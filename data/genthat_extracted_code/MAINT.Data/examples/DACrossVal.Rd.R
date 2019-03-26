library(MAINT.Data)


### Name: DACrossVal
### Title: Cross Validation for Discriminant Analysis Classification Rules
### Aliases: DACrossVal
### Keywords: discriminant analysis cross-validation

### ** Examples


## Not run: 
##D 
##D # Compare performance of linear and quadratic discriminant analysis with 
##D #  Covariance cases C1 and c4 on the ChinaT data set by 5-fold cross-validation 
##D #  replicated twice
##D 
##D # Create an Interval-Data object containing the intervals for 899 observations 
##D # on the temperatures by quarter in 60 Chinese meteorological stations.
##D 
##D ChinaT <- IData(ChinaTemp[1:8])
##D 
##D # Classical (configuration 1) Linear Discriminant Analysis 
##D 
##D CVldaC1 <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=lda,CovCase=1,kfold=5,CVrep=2)
##D summary(CVldaC1[,,"Clerr"])
##D glberrors <- apply(CVldaC1[,,"Nk"]*CVldaC1[,,"Clerr"],1,sum)/apply(CVldaC1[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D # Linear Discriminant Analysis with covariance case 3
##D 
##D CVldaC4 <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=lda,CovCase=3,kfold=5,CVrep=2)
##D summary(CVldaC4[,,"Clerr"])
##D glberrors <- apply(CVldaC4[,,"Nk"]*CVldaC4[,,"Clerr"],1,sum)/apply(CVldaC4[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D # Classical (configuration 1) Quadratic Discriminant Analysis 
##D 
##D CVqdaC1 <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=qda,CovCase=1,kfold=5,CVrep=2)
##D summary(CVqdaC1[,,"Clerr"])
##D glberrors <- apply(CVqdaC1[,,"Nk"]*CVqdaC1[,,"Clerr"],1,sum)/apply(CVqdaC1[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D # Quadratic Discriminant Analysis with covariance case 3
##D 
##D CVqdaC4 <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=qda,CovCase=3,kfold=5,CVrep=2)
##D summary(CVqdaC4[,,"Clerr"])
##D glberrors <- apply(CVqdaC4[,,"Nk"]*CVqdaC4[,,"Clerr"],1,sum)/apply(CVqdaC4[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
## End(Not run)




