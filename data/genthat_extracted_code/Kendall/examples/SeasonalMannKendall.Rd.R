library(Kendall)


### Name: SeasonalMannKendall
### Title: Mann-Kendall trend test for monthly environmental time series
### Aliases: SeasonalMannKendall
### Keywords: ts nonparametric

### ** Examples

#test for monotonic trend in monthly average river height data
#for the Rio Negro at Manaus. This data is included in the 
#package boot.
library(boot) 
data(manaus)
SeasonalMannKendall(manaus)



