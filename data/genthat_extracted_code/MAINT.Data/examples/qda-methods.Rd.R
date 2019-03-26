library(MAINT.Data)


### Name: qda-methods
### Title: Quadratic Discriminant Analysis of Interval Data
### Aliases: qda qda-methods qda,IData-method qda,IdtMxtNDE-method
###   qda,IdtHetNMANOVA-method qda,IdtGenNSNMANOVA-method
### Keywords: methods Interval Data Discriminant Analysis Interval Data

### ** Examples

# Create an Interval-Data object containing the intervals for 899 observations 
# on the temperatures by quarter in 60 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))

#Quadratic Discriminant Analysis

ChinaT.qda <- qda(ChinaT,ChinaTemp$GeoReg)
cat("Temperatures of China -- qda discriminant analysis results:\n")
print(ChinaT.qda)

## Not run: 
##D #Estimate error rates by ten-fold cross-validation replicated 20 times  
##D 
##D CVqda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=qda,CovCase=CovCase(ChinaT.qda))
##D summary(CVqda[,,"Clerr"])
##D glberrors <- 
##D   apply(CVqda[,,"Nk"]*CVqda[,,"Clerr"],1,sum)/apply(CVqda[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
## End(Not run)




