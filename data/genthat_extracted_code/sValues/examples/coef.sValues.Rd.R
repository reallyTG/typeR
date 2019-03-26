library(sValues)


### Name: coef.sValues
### Title: Extract sValues Model Coefficients/Statistics
### Aliases: coef.sValues coef.sValues betas coef.sValues t_values
###   coef.sValues s_values coef.sValues extreme_bounds

### ** Examples

data(economic_growth)
eg_sv <- sValues(GR6096 ~ ., data = economic_growth)
eg_betas <- coef(eg_sv, "betas")
eg_t_values <- coef(eg_sv, "t_values")
eg_s_values <- coef(eg_sv, "s_values")
eg_ext_bounds <- coef(eg_sv, "extreme_bounds")

# get sturdy estimates for R2 bounds 0.5 - 1
eg_s_values[abs(eg_s_values[3]) > 1, 3, drop = FALSE]





