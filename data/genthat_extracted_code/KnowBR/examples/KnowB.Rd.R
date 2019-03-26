library(KnowBR)


### Name: KnowB
### Title: Discriminating well surveyed cell units from exhaustive
###   biodiversity databases
### Aliases: KnowB
### Keywords: KnowB

### ** Examples


#Example 1. Default conditions using estimator 1 (method exact)
#but only slopes lower than 0.1 are selected for depicting
#and, therefore, only the completeness is depicted for those
#cells with the slope lower than 0.1.
#If using RWizard, for a better quality of the geographic
#coordinates, replace data(adworld) by @_Build_AdWorld_

data(adworld)
data(Beetles)
KnowB(data=Beetles, save="RData", jpg=FALSE, cutoffSlope=0.1, xl=6.1, xr=6.3)

## Not run: 
##D 
##D #Only to be used with RWizard. 
##D #Example 2. Using @_Build_AdWorld_
##D 
##D data(Beetles)
##D @_Build_AdWorld_
##D KnowB(Beetles, cell=15, save="RData")
##D 
## End(Not run)



