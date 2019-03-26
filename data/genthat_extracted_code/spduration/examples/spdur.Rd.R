library(spduration)


### Name: spdur
### Title: Split-population duration (cure) regression
### Aliases: spdur

### ** Examples

# Prepare data
data(coups)
dur.coups <- add_duration(coups, "succ.coup", unitID="gwcode", tID="year",
                           freq="year")

# Estimate model
model.coups <- spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups)
model.coups <- spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups,
                     distr="loglog")




