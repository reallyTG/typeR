library(BioGeoBEARS)


### Name: calc_AICc_column
### Title: Calculate AICc values for a list of models
### Aliases: calc_AICc_column

### ** Examples

LnL_vals = c(-34.5, -20.9)
nparam_vals = c(2, 3)
calc_AICc_column(LnL_vals, nparam_vals, samplesize=20)

LnL_vals = c(-20.9, -20.9, -20.9, -20.9)
nparam_vals = c(3, 4, 5, 6)
calc_AICc_column(LnL_vals, nparam_vals, samplesize=20)



