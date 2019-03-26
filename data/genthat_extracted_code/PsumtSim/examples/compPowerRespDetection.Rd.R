library(PsumtSim)


### Name: compPowerRespDetection
### Title: Compute power to detect differences from background where some
###   categories differ from background.
### Aliases: compPowerRespDetection
### Keywords: datagen

### ** Examples

# 
# Compute power of changes from background test (CBT) over
# a range of plausible simulation parameters, placing results
# in a dataframe.
# This code generates results, a subset of which is shown in figure 4
# of Steinmetz & Thorp 2013.
#
## Not run: 
##D require('PsumtSim')
##D require('EffectsRelBaseline')
##D require('boot')
##D 
##D if (exists('res',inherits=FALSE)) rm('res')
##D 
##D possibleCatsWithEffect<-c(1,2,5,10)
##D numRuns<-1000
##D 
##D numCats in c(5,10,20,30)) {
##D   catsWithEffect<-possibleCatsWithEffect[possibleCatsWithEffect<=numCats]
##D   
##D   for (anovaP in c(0.01,0.05)) {
##D     for (bkgRate in seq(0.5,10, by=0.5)) { 
##D       for (numCatsWithEffect in catsWithEffect) {
##D         for (fracChange in c(0.25, 0.5, 1)) {
##D         	
##D           print(paste(numCats,anovaP,bkgRate,numCatsWithEffect,fracChange))
##D           
##D           respLevel<-bkgRate*(1+fracChange)
##D       
##D           numSig<-compPowerRespDetection(bkgRate,respLevel,numCats,
##D                                           numCatsWithEffect,
##D                                           alpha=anovaP, numRuns=numRuns,
##D                                           showProgress=TRUE)
##D 
##D           df1<-data.frame(numCats=numCats,numCatsEffect=numCatsWithEffect,
##D                         fracChange=fracChange, anovaP=anovaP, bkgRate=bkgRate,
##D                         frac=numSig/numRuns)
##D       
##D           if (!exists('res',inherits=FALSE)) res<-df1
##D           else res<-rbind(res,df1)
##D         }
##D       }
##D     }
##D   }
##D }
## End(Not run)

#
# Example to generate short simulation corresponding to cross at 5 in figure 4B
# of Steinmetz & Thorp, 2013. Estimate here will be highly variable due to small
# number of runs.
#

require('PsumtSim')
require('EffectsRelBaseline')
require('boot')
possibleCatsWithEffect<-5
numRuns<-5
numCats<-30
catsWithEffect<-5
anovaP<-0.01
bkgRate<-1
numCatsWithEffect<-5
fracChange<-1
print(paste(numCats,anovaP,bkgRate,numCatsWithEffect,fracChange))
          
respLevel<-bkgRate*(1+fracChange)
      
numSig<-compPowerRespDetection(bkgRate,respLevel,numCats,
                                 numCatsWithEffect,
                                 alpha=anovaP, numRuns=numRuns,
                                 showProgress=TRUE)

df1<-data.frame(numCats=numCats,numCatsEffect=numCatsWithEffect,
                  fracChange=fracChange, anovaP=anovaP, bkgRate=bkgRate,
                  frac=numSig/numRuns)



