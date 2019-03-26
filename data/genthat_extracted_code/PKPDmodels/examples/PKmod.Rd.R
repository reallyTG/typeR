library(PKPDmodels)


### Name: PKmod
### Title: PK models with linear elimination
### Aliases: PKmod

### ** Examples

## return a function with substitutions
PKmod("bolus", "sd", list(k ~ Cl/V, Cl ~ exp(lCl), V ~ exp(lV)))



