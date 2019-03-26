library(NRejections)


### Name: sim_data
### Title: Simulate MVN data
### Aliases: sim_data

### ** Examples

cor = make_corr_mat( nX = 5,
nY = 2,
rho.XX = -0.06,
rho.YY = 0.1,
rho.XY = -0.1,
prop.corr = 8/40 )

d = sim_data( n = 50, cor = cor )



