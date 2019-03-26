library(PsumtSim)


### Name: compPowerCatSelectivity
### Title: Compute number of simulated neurons with a significant effect of
###   category using a bootstrapped F-ratio test.
### Aliases: compPowerCatSelectivity
### Keywords: datagen

### ** Examples


## Not run: 
##D # 
##D # Compute power of the F-ratio test for category selectivity over
##D # a range of plausible simulation parameters, placing results
##D # in a dataframe. This computes values a subset of which were used to 
##D # generate figure 5 of Steinmetz & Thorp, 2013.
##D #
##D 
##D if (exists('res',inherits=FALSE)) rm('res')
##D 
##D numRuns<-1000
##D 
##D for (numCats in c(5,10,20,30)) {
##D   for (anovaP in c(0.01,0.05)) {
##D     for (meanRate in seq(0.5,10,by=0.5)) {
##D       for (fracChange in c(0.1,0.25,0.5,1)) { 
##D         minRate<-meanRate*(1-fracChange)
##D         maxRate<-meanRate*(1+fracChange)
##D         respLevels<-seq(minRate,maxRate,length.out=numCats)
##D         
##D         print(paste(numCats,anovaP,meanRate,fracChange))
##D                 
##D         numSig<-compPowerCatSelectivity(respLevels,
##D                                         alpha=anovaP, numRuns=numRuns,
##D                                         showProgress=TRUE)
##D 
##D         df1<-data.frame(numCats=numCats,
##D                         fracChange=fracChange, anovaP=anovaP, meanRate=meanRate,
##D                         frac=numSig/numRuns)
##D       
##D         if (!exists('res',inherits=FALSE)) res<-df1
##D         else res<-rbind(res,df1)
##D       }
##D     }
##D   }
##D }
##D 
## End(Not run)

#
# Example of smaller simulation corresponding to circle at 0.5 fractional 
# change in figure 5A of Steinmetz & Thorp, 2013.
#
numRuns<-5
numCats<-30
anovaP<-0.05
meanRate<-0.5
fracChange<-0.5
minRate<-meanRate*(1-fracChange)
maxRate<-meanRate*(1+fracChange)
respLevels<-seq(minRate,maxRate,length.out=numCats)
        
print(paste(numCats,anovaP,meanRate,fracChange))
                
numSig<-compPowerCatSelectivity(respLevels,
                                    alpha=anovaP, numRuns=numRuns,
                                    showProgress=TRUE)

df1<-data.frame(numCats=numCats,
                  fracChange=fracChange, anovaP=anovaP, meanRate=meanRate,
                  frac=numSig/numRuns)




