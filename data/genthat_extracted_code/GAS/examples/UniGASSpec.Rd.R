library(GAS)


### Name: UniGASSpec
### Title: Univariate GAS specification
### Aliases: UniGASSpec

### ** Examples

# Specify an univariate GAS model with Student-t
# conditional distribution and time-varying location, scale and shape parameter
library("GAS")

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = TRUE,
                                   scale = TRUE, shape = TRUE))

GASSpec



