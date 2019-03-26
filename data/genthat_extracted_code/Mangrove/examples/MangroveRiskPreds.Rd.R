library(Mangrove)


### Name: MangroveRiskPreds
### Title: The MangroveRiskPreds class
### Aliases: MangroveRiskPreds calcORs applyORs print.MangroveRiskPreds
###   summary.MangroveRiskPreds plot.MangroveRiskPreds
### Keywords: classes methods

### ** Examples

data(ccped)
data(exampleORs)
ccors <- calcORs(ccped,exampleORs)

summary(ccors)
plot(ccors)

ccposts <- applyORs(ccors,0.02)




