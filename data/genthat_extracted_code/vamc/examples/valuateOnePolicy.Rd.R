library(vamc)


### Name: valuateOnePolicy
### Title: Valuate a VA policy specified in inPolicy based on the simulated
###   fund scenarios fundScen. The time step length is specified in dT and
###   the discount rate for each period is specified in df.
### Aliases: valuateOnePolicy

### ** Examples

fundScen <- genFundScen(fundMap, indexScen)[1, , ]
exPolicy <- VAPort[1, ]
valuateOnePolicy(exPolicy, mortTable, fundScen, 1 / 12, cForwardCurve)



