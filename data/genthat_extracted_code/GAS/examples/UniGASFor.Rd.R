library(GAS)


### Name: UniGASFor
### Title: Forecast with univariate GAS models
### Aliases: UniGASFor uGASMultiForcast

### ** Examples

# Specify an univariate GAS model with Student-t
# conditional distribution and time-varying location, scale and shape parameter

# Inflation Forecast

set.seed(123)

data("cpichg")

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = TRUE, scale = TRUE, shape = FALSE))

# Perform H-step ahead forecast with confidence bands

Fit = UniGASFit(GASSpec, cpichg)
Forecast = UniGASFor(Fit, H = 12)

Forecast

# Perform 1-Step ahead rolling forecast

InsampleData = cpichg[1:250]
OutSampleData = cpichg[251:276]

Fit = UniGASFit(GASSpec, InsampleData)

Forecast = UniGASFor(Fit, Roll = TRUE, out = OutSampleData)

Forecast



