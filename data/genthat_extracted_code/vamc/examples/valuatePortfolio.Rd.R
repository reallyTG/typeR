library(vamc)


### Name: valuatePortfolio
### Title: Valuate a portfolio VA policies specified in each curPolicy of
###   inPortfolio based on the simulated fund scenarios fundScen. The time
###   step length is specified in dT and the discount rate for each period
###   is specified in df.
### Aliases: valuatePortfolio

### ** Examples

fundScen <- genFundScen(fundMap, indexScen)[1, , ]
valuatePortfolio(VAPort[1:2, ], mortTable, fundScen, 1 / 12, cForwardCurve)



