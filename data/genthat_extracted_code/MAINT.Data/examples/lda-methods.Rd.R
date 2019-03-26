library(MAINT.Data)


### Name: lda-methods
### Title: Linear Discriminant Analysis of Interval Data
### Aliases: lda lda-methods lda,IData-method lda,IdtMxtNDE-method
###   lda,IdtClMANOVA-method lda,IdtLocNSNMANOVA-method
### Keywords: methods Interval Data Discriminant Analysis Interval Data

### ** Examples


# Create an Interval-Data object containing the intervals for 899 observations 
# on the temperatures by quarter in 60 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))

#Linear Discriminant Analysis

ChinaT.lda <- lda(ChinaT,ChinaTemp$GeoReg)
cat("Temperatures of China -- linear discriminant analysis results:\n")
print(ChinaT.lda)
cat("lda Prediction results:\n")
print(predict(ChinaT.lda,ChinaT)$class)

## Not run: 
##D #Estimate error rates by ten-fold cross-validation replicated 20 times  
##D 
##D CVlda <- DACrossVal(ChinaT,ChinaTemp$GeoReg,TrainAlg=lda,CovCase=CovCase(ChinaT.lda))
##D summary(CVlda[,,"Clerr"])
##D glberrors <- 
##D   apply(CVlda[,,"Nk"]*CVlda[,,"Clerr"],1,sum)/apply(CVlda[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
## End(Not run)




