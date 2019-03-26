library(RcmdrPlugin.TeachStat)


### Name: W.numSummary
### Title: Summary statistics for weighted variables
### Aliases: W.numSummary

### ** Examples

data(cars93)

# no weighted
W.numSummary(data=cars93[,c("CityMPG")], statistics =c("mean", "sd", "IQR", "quantiles"),
   quantiles = c(0,0.25,0.5,0.75,1), weights=NULL, groups=NULL)
# weighted
W.numSummary(data=cars93[,c("CityMPG")], statistics =c("mean", "sd", "IQR", "quantiles"),
   quantiles = c(0,0.25,0.5,0.75,1), weights=cars93$FuelCapacity, groups=NULL)
# no weighted
W.numSummary(data=cars93[,c("CityMPG")], statistics =c("mean", "sd", "IQR", "quantiles"),
   quantiles = c(0,0.25,0.5,0.75,1), weights=NULL, groups=cars93$Manual)
# weighted
bb <- W.numSummary(data=cars93[,c("CityMPG")], statistics =c("mean", "sd", "IQR", "quantiles"),
   quantiles = c(0,0.25,0.5,0.75,1), weights=cars93$FuelCapacity, groups=cars93$Manual)

bb
str(bb)
class(bb)



