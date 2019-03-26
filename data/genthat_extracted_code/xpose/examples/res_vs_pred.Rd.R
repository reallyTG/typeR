library(xpose)


### Name: res_vs_pred
### Title: Residuals plotted against population predictions
### Aliases: res_vs_pred absval_res_vs_pred

### ** Examples

# Standard residual
res_vs_pred(xpdb_ex_pk, res = c('IWRES', 'CWRES'))

# Absolute value of the residuals
absval_res_vs_pred(xpdb_ex_pk, res = 'CWRES')




