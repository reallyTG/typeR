library(VarianceGamma)


### Name: vgChangePars
### Title: Change Parameterizations of the Variance Gamma Distribution
### Aliases: vgChangePars

### ** Examples

param1 <- c(2,2,1,3)                   # Parameterization 1
param2 <- vgChangePars(1, 2, param1)   # Convert to parameterization 2
param2                                 # Parameterization 2
vgChangePars(2, 1, as.numeric(param2)) # Convert back to parameterization 1

param3 <- c(1,2,0,0.5)                 # Parameterization 3
param1 <- vgChangePars(3, 1, param3)   # Convert to parameterization 1
param1                                 # Parameterization 1
vgChangePars(1, 3, as.numeric(param1)) # Convert back to parameterization 3



