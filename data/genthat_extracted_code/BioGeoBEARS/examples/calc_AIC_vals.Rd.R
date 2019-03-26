library(BioGeoBEARS)


### Name: calc_AIC_vals
### Title: Calculate AICs for a list of models
### Aliases: calc_AIC_vals

### ** Examples

LnL_vals = c(-34.5, -20.9)
nparam_vals = c(2, 3)
calc_AIC_vals(LnL_vals, nparam_vals)

LnL_vals = c(-20.9, -20.9, -20.9, -20.9)
nparam_vals = c(3, 4, 5, 6)
calc_AIC_vals(LnL_vals, nparam_vals)



