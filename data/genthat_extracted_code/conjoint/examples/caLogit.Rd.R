library(conjoint)


### Name: caLogit
### Title: Function caLogit estimates participation (market share) of the
###   simulation profiles
### Aliases: caLogit
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
simutil<-caLogit(tsimp,tpref,tprof)
print("Percentage participation of profiles: ", quote=FALSE)
print(simutil)

#Example 2
library(conjoint)
data(chocolate)
simutil<-caLogit(csimp,cpref,cprof)
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



