library(fRegression)


### Name: regSim
### Title: Regression Model Simulation
### Aliases: regSim LM3 LOGIT3 GAM3
### Keywords: models

### ** Examples

## LM2 -
   # Data for a user defined linear regression model:
   LM2 = function(n){
     x = rnorm(n)
     y = rnorm(n)
     eps = 0.1 * rnorm(n)
     z = 0.5 + 0.75 * x + 0.25 * y + eps
     data.frame(Z = z, X = x, Y = y)
   }
   for (FUN in c("LM2", "LM3")) {
     cat(FUN, ":\n", sep = "")
     print(regSim(model = FUN, n = 10))
   }



