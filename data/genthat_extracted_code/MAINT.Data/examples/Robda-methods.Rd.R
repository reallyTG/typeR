library(MAINT.Data)


### Name: Robda-methods
### Title: Robust Discriminant Analysis of Interval Data
### Aliases: Roblda Roblda-methods Roblda,IData-method Robqda
###   Robqda-methods Robqda,IData-method
### Keywords: methods Interval Data Discriminant Analysis Interval Data

### ** Examples

# Create an Interval-Data object containing the intervals for 899 observations 
# on the temperatures by quarter in 60 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))

#Robust Linear Discriminant Analysis

## Not run: 
##D 
##D ChinaT.rlda <- Roblda(ChinaT,ChinaTemp$GeoReg)
##D cat("Temperatures of China -- robust lda discriminant analysis results:\n")
##D print(ChinaT.rlda)
##D 
##D #Estimate error rates by ten-fold cross-validation with 5 replications 
##D 
##D CVrlda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=Roblda,CovCase=CovCase(ChinaT.rlda),
##D    CVrep=5)
##D 
##D summary(CVrlda[,,"Clerr"])
##D 
##D glberrors <- 
##D   apply(CVrlda[,,"Nk"]*CVrlda[,,"Clerr"],1,sum)/apply(CVrlda[,,"Nk"],1,sum)
##D 
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D #Robust Quadratic Discriminant Analysis
##D 
##D ChinaT.rqda <- Robqda(ChinaT,ChinaTemp$GeoReg)
##D cat("Temperatures of China -- robust qda discriminant analysis results:\n")
##D print(ChinaT.rqda)
##D 
##D #Estimate error rates by ten-fold cross-validation with 5 replications 
##D 
##D CVrqda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=Robqda,CovCase=CovCase(ChinaT.rqda),
##D    CVrep=5)
##D 
##D summary(CVrqda[,,"Clerr"])
##D 
##D glberrors <- 
##D   apply(CVrqda[,,"Nk"]*CVrqda[,,"Clerr"],1,sum)/apply(CVrqda[,,"Nk"],1,sum)
##D 
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
## End(Not run)




