library(GAS)


### Name: MultiGASSpec
### Title: Multivariate GAS specification
### Aliases: MultiGASSpec

### ** Examples

# Specify a GAS model with multivariate Student-t
# conditional distribution and time-varying locations,
# scales and correlations  parameters but constant shape parameter.

library("GAS")

GASSpec = MultiGASSpec(Dist = "mvt", ScalingType = "Identity",
                       GASPar = list(location = TRUE, scale = TRUE,
                                     correlation = TRUE, shape = FALSE))

GASSpec




