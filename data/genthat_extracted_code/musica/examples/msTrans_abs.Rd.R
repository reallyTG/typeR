library(musica)


### Name: msTrans_abs
### Title: Multiscale quantile mapping bias correction
### Aliases: msTrans_abs

### ** Examples

data("basin_PT")
scen = basin_PT$sim_scen
ctrl = basin_PT$sim_ctrl
obs = basin_PT$obs_ctrl
dta = list(TO = obs, FROM = ctrl, NEWDATA = scen)
## Not run: 
##D msTrans_abs(dta,  maxiter = 10, period = 'D1')
## End(Not run)



