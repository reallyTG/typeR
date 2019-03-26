library(xpose)


### Name: qq_plot
### Title: QQ plots of ETA and residuals
### Aliases: qq_plot prm_qq eta_qq res_qq cov_qq

### ** Examples

# QQ plot of parameters
prm_qq(xpdb_ex_pk)

# QQ plot of eta
eta_qq(xpdb_ex_pk)

# QQ plot of residuals
res_qq(xpdb_ex_pk, res = c('IWRES', 'CWRES'))

# QQ plot of continuous covariates
cov_qq(xpdb_ex_pk)




