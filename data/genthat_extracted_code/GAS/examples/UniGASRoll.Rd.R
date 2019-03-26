library(GAS)


### Name: UniGASRoll
### Title: Rolling forecast with univariate GAS models
### Aliases: UniGASRoll

### ** Examples

# Specify an univariate GAS model with Student-t
# conditional distribution and time-varying location, scale and shape parameter

# Inflation Forecast

data("cpichg")
help(cpichg)

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = TRUE, scale = TRUE, shape = FALSE))

# Perform 1-step ahead rolling forecast with refit
library("parallel")

Roll = UniGASRoll(cpichg, GASSpec, ForecastLength = 50,
                  RefitEvery = 12, RefitWindow = c("moving"))


Roll



