library(IDE)


### Name: IDE
### Title: Construct IDE object, fit and predict
### Aliases: IDE fit.IDE predict.IDE

### ** Examples

SIM1 <- simIDE(T = 5, nobs = 100, k_spat_invariant = 1)
IDEmodel <- IDE(f = z ~ s1 + s2,
                data = SIM1$z_STIDF,
                dt = as.difftime(1, units = "days"),
                grid_size = 41)
## No test: 
fit_results_sim1 <- fit.IDE(IDEmodel,
                            parallelType = 1)
ST_grid_df <- predict(fit_results_sim1$IDEmodel)
## End(No test)



