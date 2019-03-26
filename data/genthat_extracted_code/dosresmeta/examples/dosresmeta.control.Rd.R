library(dosresmeta)


### Name: dosresmeta.control
### Title: Ancillary Parameters for Controlling the Fit in dosresmeta
###   Models
### Aliases: dosresmeta.control

### ** Examples

## Loading data
data("alcohol_cvd")

## print the iterations (see ?optim) and change the default for starting values
dosresmeta(formula = logrr ~ dose, type = type, id = id, se = se, 
           cases = cases, n = n, data = alcohol_cvd, proc = "1stage",
           control = list(showiter = TRUE, igls.iter = 20))
           



