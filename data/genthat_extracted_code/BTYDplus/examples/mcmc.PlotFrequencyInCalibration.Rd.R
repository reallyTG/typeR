library(BTYDplus)


### Name: mcmc.PlotFrequencyInCalibration
### Title: Frequency in Calibration Period for Pareto/GGG, Pareto/NBD (HB)
###   and Pareto/NBD (Abe)
### Aliases: mcmc.PlotFrequencyInCalibration

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
##D param.draws <- pnbd.mcmc.DrawParameters(cbs,
##D   mcmc = 200, burnin = 100, thin = 20, chains = 1) # short MCMC to run demo fast
##D mcmc.PlotFrequencyInCalibration(param.draws, cbs, sample_size = 100)
## End(Not run)



