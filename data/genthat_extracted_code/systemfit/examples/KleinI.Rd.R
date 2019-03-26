library(systemfit)


### Name: KleinI
### Title: Klein Model I
### Aliases: KleinI
### Keywords: datasets

### ** Examples

## Repeating the estimations of Klein's (1950) Model I
## in Greene (2003, pp. 381 and 412)
data( "KleinI" )
eqConsump  <- consump ~ corpProf + corpProfLag + wages
eqInvest   <- invest ~ corpProf + corpProfLag + capitalLag
eqPrivWage <- privWage ~ gnp + gnpLag + trend
inst <- ~ govExp + taxes + govWage + trend + capitalLag + corpProfLag + gnpLag
system <- list( Consumption = eqConsump, Investment = eqInvest,
   PrivateWages = eqPrivWage )
# OLS
kleinOls <- systemfit( system, data = KleinI )
summary( kleinOls )
# 2SLS
klein2sls <- systemfit( system, "2SLS", inst = inst, data = KleinI,
   methodResidCov = "noDfCor" )
summary( klein2sls )
# 3SLS
klein3sls <- systemfit( system, "3SLS", inst = inst, data = KleinI,
   methodResidCov = "noDfCor" )
summary( klein3sls )
# I3SLS
kleinI3sls <- systemfit( system, "3SLS", inst = inst, data = KleinI,
   methodResidCov = "noDfCor", maxit = 500 )
summary( kleinI3sls )



