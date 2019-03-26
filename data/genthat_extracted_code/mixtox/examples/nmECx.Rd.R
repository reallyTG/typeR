library(mixtox)


### Name: nmECx
### Title: Effect Concentration Calculation for J-shaped Models
### Aliases: nmECx
### Keywords: effect concentration non-monotonic curve

### ** Examples

## example 1
# calculate ECL-10, ECR-10, EC5, and EC50 of the four hormetic curves 
model <- hormesis$sgl$model
param <- hormesis$sgl$param
minx <- hormesis$sgl$minx
nmECx(model, param, effv = c(-0.10, 0.05, 0.50), minx)



