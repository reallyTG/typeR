library(dosresmeta)


### Name: dosresmeta.fixed
### Title: Fixed-Effects Estimator for dosresmeta Models
### Aliases: dosresmeta.fixed

### ** Examples

data("alcohol_crc")

## Fixed-effect dose-response model assuming linearity
dosresmeta(formula = logrr ~ dose, type = type, id = id, se = se, 
           cases = cases, n = peryears, data = alcohol_crc, method = "fixed")




