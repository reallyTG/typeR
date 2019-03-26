library(finalfit)


### Name: ff_newdata
### Title: Generate newdata for simulations
### Aliases: ff_newdata finalfit_newdata

### ** Examples

# See boot_predict.
library(finalfit)
library(dplyr)

# Predict probability of death across combinations of factor levels
explanatory = c("age.factor", "extent.factor", "perfor.factor")
dependent = 'mort_5yr'

# Generate combination of explanatory variable levels rowwise
colon_s %>%
  finalfit_newdata(explanatory = explanatory, newdata = list(
    c("<40 years",  "Submucosa", "No"),
    c("<40 years", "Submucosa", "Yes"),
    c("<40 years", "Adjacent structures", "No"),
    c("<40 years", "Adjacent structures", "Yes")
   )) -> newdata

# Generate combination of explanatory variable levels colwise.
explanatory = c("nodes", "extent.factor", "perfor.factor")
colon_s %>%
  finalfit_newdata(explanatory = explanatory, rowwise = FALSE, newdata = list(
  rep(seq(0, 30), 4),
  c(rep("Muscle", 62), rep("Adjacent structures", 62)),
  c(rep("No", 31), rep("Yes", 31), rep("No", 31), rep("Yes", 31))
)) -> newdata




