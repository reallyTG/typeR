library(sdcMicro)


### Name: localSupp
### Title: Local Suppression
### Aliases: localSupp
### Keywords: manip

### ** Examples

## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
keyVars <- paste0("Key",1:4)
f <- freqCalc(francdat, keyVars=keyVars,w=8)
f
f$fk
f$Fk
## individual risk calculation:
indivf <- indivRisk(f)
indivf$rk
## Local Suppression
localS <- localSupp(f, keyVar="Key4", threshold=0.15)
f2 <- freqCalc(localS$freqCalc, keyVars=keyVars, w=8)
indivf2 <- indivRisk(f2)
indivf2$rk
identical(indivf$rk, indivf2$rk)

## select another keyVar and run localSupp once again,
# if you think the table is not fully protected

## for objects of class sdcMicro:
data(testdata)
sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- localSupp(sdc, keyVar='urbrur', threshold=0.045)
print(sdc, type="ls")




