library(mkin)


### Name: mmkin
### Title: Fit one or more kinetic models with one or more state variables
###   to one or more datasets
### Aliases: mmkin
### Keywords: optimize

### ** Examples

## Not run: 
##D m_synth_SFO_lin <- mkinmod(parent = mkinsub("SFO", "M1"),
##D                            M1 = mkinsub("SFO", "M2"),
##D                            M2 = mkinsub("SFO"), use_of_ff = "max")
##D 
##D m_synth_FOMC_lin <- mkinmod(parent = mkinsub("FOMC", "M1"),
##D                             M1 = mkinsub("SFO", "M2"),
##D                             M2 = mkinsub("SFO"), use_of_ff = "max")
##D 
##D models <- list(SFO_lin = m_synth_SFO_lin, FOMC_lin = m_synth_FOMC_lin)
##D datasets <- lapply(synthetic_data_for_UBA_2014[1:3], function(x) x$data)
##D names(datasets) <- paste("Dataset", 1:3)
##D 
##D time_default <- system.time(fits.0 <- mmkin(models, datasets, quiet = TRUE))
##D time_1 <- system.time(fits.4 <- mmkin(models, datasets, cores = 1, quiet = TRUE))
##D 
##D time_default
##D time_1
##D 
##D endpoints(fits.0[["SFO_lin", 2]])
##D 
##D # plot.mkinfit handles rows or columns of mmkin result objects
##D plot(fits.0[1, ])
##D plot(fits.0[1, ], obs_var = c("M1", "M2"))
##D plot(fits.0[, 1])
##D # Use double brackets to extract a single mkinfit object, which will be plotted
##D # by plot.mkinfit and can be plotted using plot_sep
##D plot(fits.0[[1, 1]], sep_obs = TRUE, show_residuals = TRUE, show_errmin = TRUE)
##D plot_sep(fits.0[[1, 1]])
##D # Plotting with mmkin (single brackets, extracting an mmkin object) does not
##D # allow to plot the observed variables separately
##D plot(fits.0[1, 1])
## End(Not run)



