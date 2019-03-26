library(sdcMicro)


### Name: LocalRecProg
### Title: Local recoding via Edmond's maximum weighted matching algorithm
### Aliases: LocalRecProg
### Keywords: manip

### ** Examples

# LocalRecProg
data(testdata2)
r1=LocalRecProg(testdata2,
  categorical=c("urbrur", "roof", "walls", "water", "sex", "relat"),
  missingValue=-99)
r2=LocalRecProg(testdata2,
  categorical=c("urbrur", "roof", "walls", "water", "sex", "relat"),
    ancestor=c("water2", "water3", "relat2"),
    ancestor_setting=c("water","water","relat"),missingValue=-99)
r3=LocalRecProg(testdata2,
  categorical=c("urbrur", "roof", "walls", "water", "sex", "relat"),
    ancestor=c("water2", "water3", "relat2"),
    ancestor_setting=c("water","water","relat"),missingValue=-99,
    FindLowestK=FALSE)

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- LocalRecProg(sdc)



