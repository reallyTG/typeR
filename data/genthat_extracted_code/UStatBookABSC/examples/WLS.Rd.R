library(UStatBookABSC)


### Name: WLS
### Title: Computes a weighted least squares linear regression on possibly
###   multivariate responses
### Aliases: WLS

### ** Examples

 ## Not run: 
##D  DataY = cbind(CCU12_Precip$Precip, CCU12_Precip$TMax);
##D DataX = cbind(rep(1, length(CCU12_Precip$Precip)), CCU12_Precip$TMin)			
##D BetaHat.New = WLS(DataY, DataX)
##D     		
## End(Not run)





