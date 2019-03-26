library(xpose)


### Name: distrib_plot
### Title: Distribution plots of ETA and parameters
### Aliases: distrib_plot prm_distrib eta_distrib res_distrib cov_distrib

### ** Examples

# Histogram of parameters
prm_distrib(xpdb_ex_pk, type = 'h')

# Density plot of etas with a rug
eta_distrib(xpdb_ex_pk, type = 'dr')

# Histogram of different residuals
res_distrib(xpdb_ex_pk, type = 'hr', res = c('IWRES', 'CWRES'))

# Density plot of continuous covariates
cov_distrib(xpdb_ex_pk, type = 'd')



