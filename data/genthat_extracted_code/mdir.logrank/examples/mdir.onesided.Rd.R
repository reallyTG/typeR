library(mdir.logrank)


### Name: mdir.onesided
### Title: Two-sample multiple-direction log rank test for stochastic
###   ordered alternatives
### Aliases: mdir.onesided

### ** Examples

library(coin)
data(GTSG)
out <- mdir.onesided(data = GTSG, group1 = "Chemotherapy+Radiation", iter = 1000)

## Detailed information:
summary(out)




