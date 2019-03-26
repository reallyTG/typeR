library(AER)


### Name: Electricity1970
### Title: Cost Function of Electricity Producers 1970
### Aliases: Electricity1970
### Keywords: datasets

### ** Examples

data("Electricity1970")

## Greene (2003), Ex. 5.6: a generalized Cobb-Douglas cost function
fm <- lm(log(cost/fuel) ~ log(output) + I(log(output)^2/2) + 
  log(capital/fuel) + log(labor/fuel), data=Electricity1970[1:123,])




