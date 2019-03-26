library(UStatBookABSC)


### Name: L1Regression
### Title: Computes a L1 multivariate regression This is the equivalent of
###   median regression when the response is possibly multivariate
### Aliases: L1Regression

### ** Examples

 ## Not run: 
##D DataY = cbind(CCU12_Precip$Precip, CCU12_Precip$TMax);
##D DataX = cbind(rep(1, length(CCU12_Precip$Precip)), CCU12_Precip$TMin)			
##D A2 = L1Regression(DataY, DataX)
##D     		
## End(Not run)





