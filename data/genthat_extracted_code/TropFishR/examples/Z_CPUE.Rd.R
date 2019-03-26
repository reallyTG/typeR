library(TropFishR)


### Name: Z_CPUE
### Title: Estimate Z from CPUE data
### Aliases: Z_CPUE
### Keywords: CPUE Z function mortality

### ** Examples

# load data
data(synCPUE)

# run model with standard method
Z_CPUE(synCPUE, method = "standard")

# run model with Heincke's method
Z_CPUE(synCPUE, method = "Heincke")

# run model with Robson and Chapman's method
Z_CPUE(synCPUE, method = "RobsonChapman", omit_age1 = TRUE)




