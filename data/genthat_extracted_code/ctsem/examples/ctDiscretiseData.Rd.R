library(ctsem)


### Name: ctDiscretiseData
### Title: Discretise long format continuous time (ctsem) data to specific
###   timestep.
### Aliases: ctDiscretiseData

### ** Examples

long <- ctWideToLong(datawide=ctExample2,Tpoints=8,n.manifest=2,n.TDpred=1,
 manifestNames=c('LeisureTime','Happiness'),
 TDpredNames=c('MoneyInt'))

long <- ctDeintervalise(long)

long <- ctDiscretiseData(dlong=long, timestep = 1.1,TDpredNames=c('MoneyInt'))



