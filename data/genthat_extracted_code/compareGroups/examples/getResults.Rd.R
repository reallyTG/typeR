library(compareGroups)


### Name: getResults
### Title: Easily retrieve summary data as R-objects (matrices and
###   vectors).
### Aliases: getResults
### Keywords: utilities

### ** Examples

require(compareGroups)
data(regicor)
res<-compareGroups(sex ~ . ,regicor,method=c(triglyc=2))
# retrieve descriptives
getResults(res)
# retrieve OR and their corresponding p-values
getResults(res,what="ratio")



