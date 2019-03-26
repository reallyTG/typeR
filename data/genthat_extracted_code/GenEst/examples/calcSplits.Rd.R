library(GenEst)


### Name: calcSplits
### Title: Estimate the number of fatalities by up to two splitting
###   covariates
### Aliases: calcSplits

### ** Examples

 ## No test: 
  model_SE <- pkm(p ~ 1, k ~ 1, data = wind_RPbat$SE)
  model_CP <- cpm(l ~ 1, s ~ 1, data = wind_RPbat$CP, dist = "weibull",
    left = "LastPresent", right = "FirstAbsent")
  Mhat <- estM(nsim = 1000, data_CO = wind_RPbat$CO, 
    data_SS = wind_RPbat$SS, data_DWP = wind_RPbat$DWP, 
    model_SE = model_SE, model_CP = model_CP,
    unitCol = "Turbine", COdate = "DateFound")

  M_spp <- calcSplits(M = Mhat, split_CO = "Species",
    data_CO = wind_RPbat$CO)
  summary(M_spp)
  plot(M_spp)
 
## End(No test)



