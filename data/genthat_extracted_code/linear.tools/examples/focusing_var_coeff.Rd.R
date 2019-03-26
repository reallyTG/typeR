library(linear.tools)


### Name: focusing_var_coeff
### Title: focusing on selected variables in the model, and eliminating
###   impacts from other variables.
### Aliases: focusing_var_coeff

### ** Examples


focus_var_raw  = 'carat'

model = lm(price~ cut + carat + I(carat^2) + I(carat^3) +
             I(carat  * depth) + depth,ggplot2::diamonds)
# all coeffs except carat's will be 0
focusing_var_coeff(model, focus_var_coeff = 'carat')
# all coeffs except cut.L's will be 0
focusing_var_coeff(model, focus_var_coeff = 'cut.L')
# all coeffs without raw vars cut or carat will be 0
focusing_var_coeff(model, focus_var_raw = c('cut','carat'))

# if you didn't specify anything, then all vars' coeff will become 0 except intercept
focusing_var_coeff(model)


# if cannot find the focus_var_coeff or focus_var_raw in the model
tryCatch(focusing_var_coeff(model, focus_var_coeff = 'caratdsd'),
         error = function(err) warning(err))
tryCatch(focusing_var_coeff(model, focus_var_raw = '3213'),
         error = function(err) warning(err))




