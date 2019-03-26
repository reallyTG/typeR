library(dosresmeta)


### Name: gof
### Title: Computes statistics to evaluate the goodness-of-fit from
###   dosresmeta Objects
### Aliases: gof print.gof.dosresmeta

### ** Examples

## Loading the data
data("milk_ov")

## Linear dose-response model
lin <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                 se = se, cases = case, n = n, data = milk_ov)
                 
## Display goodness-of-fit statistics
gof(lin)

## Meta-regression model
lin_reg <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
  se = se, cases = case, n = n, data = milk_ov,
  mod = ~ type)

## Display goodness-of-fit statistics for meta-regression model
gof(lin_reg)
 



