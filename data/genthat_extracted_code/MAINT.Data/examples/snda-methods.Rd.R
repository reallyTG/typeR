library(MAINT.Data)


### Name: snda-methods
### Title: Skew-Normal Discriminant Analysis of Interval Data
### Aliases: snda snda-methods snda,IData-method snda,IdtLocSNMANOVA-method
###   snda,IdtLocNSNMANOVA-method snda,IdtGenSNMANOVA-method
###   snda,IdtGenNSNMANOVA-method
### Keywords: methods Interval Data Discriminant Analysis Interval Data

### ** Examples


## Not run: 
##D 
##D # Create an Interval-Data object containing the intervals for 899 observations 
##D # on the temperatures by quarter in 60 Chinese meteorological stations.
##D 
##D ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))
##D 
##D # Skew-Normal based discriminant analysis, asssuming that the different regions differ
##D # only in location parameters
##D 
##D ChinaT.locsnda <- snda(ChinaT,ChinaTemp$GeoReg,Mxt="Loc")
##D 
##D cat("Temperatures of China -- SkewNormal location model discriminant analysis results:\n")
##D print(ChinaT.locsnda)
##D 
##D #Estimate error rates by three-fold cross-validation without replication  
##D 
##D CVlocsnda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=snda,Mxt="Loc",
##D   CovCase=CovCase(ChinaT.locsnda),kfold=3,CVrep=1)
##D 
##D summary(CVlocsnda[,,"Clerr"])
##D 
##D glberrors <- 
##D   apply(CVlocsnda[,,"Nk"]*CVlocsnda[,,"Clerr"],1,sum)/apply(CVlocsnda[,,"Nk"],1,sum)
##D 
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D # Skew-Normal based discriminant analysis, asssuming that the different regions may differ
##D # in all SkewNormal parameters
##D 
##D ChinaT.gensnda <- snda(ChinaT,ChinaTemp$GeoReg,Mxt="Gen")
##D 
##D cat("Temperatures of China -- SkewNormal general model discriminant analysis results:\n")
##D print(ChinaT.gensnda)
##D 
##D #Estimate error rates by three-fold cross-validation without replication  
##D 
##D CVgensnda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=snda,Mxt="Gen",
##D   CovCase=CovCase(ChinaT.gensnda),kfold=3,CVrep=1)
##D 
##D summary(CVgensnda[,,"Clerr"])
##D 
##D glberrors <- 
##D   apply(CVgensnda[,,"Nk"]*CVgensnda[,,"Clerr"],1,sum)/apply(CVgensnda[,,"Nk"],1,sum)
##D 
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
## End(Not run)




