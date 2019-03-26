library(itsadug)


### Name: acf_n_plots
### Title: Generate N ACF plots of individual or aggregated time series.
### Aliases: acf_n_plots

### ** Examples

data(simdat)

# Separate ACF for each time series:
acf_n_plots(simdat$Y, split_by=list(simdat$Subject, simdat$Trial))

# Average ACF per participant:
acf_n_plots(simdat$Y, split_by=list(simdat$Subject))

## Not run: 
##D # Data treated as single time series. Plot is added to current window.
##D # Note: 1 time series results in 1 plot.
##D acf_n_plots(simdat$Y, add=TRUE)
##D # Plot 4 ACF plots doesn't work without splitting data:
##D acf_n_plots(simdat$Y, add=TRUE, n=4)
##D 
##D # Plot ACFs of 4 randomly selected time series:
##D acf_n_plots(simdat$Y, random=TRUE, n=4, add=TRUE, 
##D     split_by=list(simdat$Subject, simdat$Trial))
##D 
## End(Not run)

#---------------------------------------------
# When using model residuals
#---------------------------------------------

## Not run: 
##D # add missing values to simdat:
##D simdat[sample(nrow(simdat), 15),]$Y <- NA
##D # simple linear model:
##D m1 <- lm(Y ~ Time, data=simdat)
##D 
##D # This will generate an error:
##D # acf_n_plots(resid(m1), split_by=list(simdat$Subject, simdat$Trial))
##D 
##D # This should work:
##D el.na <- missing_est(m1)
##D acf_n_plots(resid(m1), 
##D      split_by=list(simdat[-el.na,]$Subject, simdat[-el.na,]$Trial))
##D 
##D # This should also work:
##D simdat$res <- NA
##D simdat[!is.na(simdat$Y),]$res <- resid(m1)
##D acf_n_plots(simdat$res, split_by=list(simdat$Subject, simdat$Trial))
## End(Not run)

# see the vignette for examples:
vignette("acf", package="itsadug")



