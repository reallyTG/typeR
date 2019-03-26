library(dosresmeta)


### Name: logLik.dosresmeta
### Title: Extract Log-Likelihood from dosresmeta Objects
### Aliases: logLik.dosresmeta

### ** Examples

data("alcohol_crc")

## Dose-response model assuming linearity
lin <- dosresmeta(formula = logrr ~ dose, type = type, id = id, se = se, 
           cases = cases, n = peryears, data = alcohol_crc, proc = "1stage")

## Log-likelihood
ll <- logLik(lin)
ll
attributes(ll)

## AIC and BIC
AIC(ll)
BIC(ll)




