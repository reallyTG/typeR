library(conjoint)


### Name: caBTL
### Title: Function caBTL estimates participation (market share) of
###   simulation profiles
### Aliases: caBTL
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
simutil<-caBTL(tsimp,tpref,tprof)
print("Percentage participation of profiles: ", quote=FALSE)
print(simutil)

#Example 2
library(conjoint)
data(chocolate)
simutil<-caBTL(csimp,cpref,cprof)
print("Percentage participation of profiles:", quote=FALSE)
print(simutil)

#Example 3
library(conjoint)
data(chocolate)
ShowAllSimulations(csimp,cpref,cprof)

#Example 4
#library(conjoint)
#data(journey)
#ShowAllSimulations(jsimp,jpref,jprof)



