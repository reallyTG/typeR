library(musica)


### Name: msTrans_dif
### Title: Multiscale delta method
### Aliases: msTrans_dif

### ** Examples

data("basin_PT")
scen = basin_PT$sim_scen
ctrl = basin_PT$sim_ctrl
obs = basin_PT$obs_ctrl
dta = list(TO = scen, FROM = ctrl, NEWDATA = obs)
## Not run: 
##D msTrans_dif(dta,  maxiter = 10, period = 'D1')
## End(Not run)



