library(UStatBookABSC)


### Name: FitAndResiduals
### Title: Computes a linear regression fit and residuals on possibly
###   multivariate responses
### Aliases: FitAndResiduals

### ** Examples

 ## Not run: 
##D  DataY = cbind(CCU12_Precip$Precip, CCU12_Precip$TMax);
##D DataX = cbind(rep(1, length(CCU12_Precip$Precip)), CCU12_Precip$TMin)			
##D BetaHat.New = WLS(DataY, DataX)
##D Results.New = FitAndResiduals(DataY, DataX, BetaHat.New);
##D     		
## End(Not run)





