library(ctsem)


### Name: ctWideToLong
### Title: ctWideToLong Convert ctsem wide to long format
### Aliases: ctWideToLong

### ** Examples

 #First load the example ctsem wide format data with absolute times
 data('datastructure')
 datastructure #contains two time intervals (dTx), therefore 3 time points.
 #Then convert to long format
 longexample <- ctWideToLong(datawide = datastructure, Tpoints=3, 
 n.manifest=3, manifestNames = c("Y1", "Y2", "Y3"),
 n.TDpred=1, TDpredNames = "TD1", 
 n.TIpred=2, TIpredNames = c("TI1", "TI2"))

 #Then convert the time intervals to absolute time
 long <- ctDeintervalise(datalong = longexample, id='id', dT='dT')
 long





