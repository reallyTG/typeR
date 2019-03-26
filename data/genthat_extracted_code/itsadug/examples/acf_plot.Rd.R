library(itsadug)


### Name: acf_plot
### Title: Generate an ACF plot of an aggregated time series.
### Aliases: acf_plot

### ** Examples

data(simdat)

# Default acf function:
acf(simdat$Y)
# Same plot with acf_plot:
acf_plot(simdat$Y)
# Average of ACFs per time series:
acf_plot(simdat$Y, split_by=list(simdat$Subject, simdat$Trial))
# Median of ACFs per time series:
acf_plot(simdat$Y, split_by=list(simdat$Subject, simdat$Trial), fun=median)

# extract value of Lag1:
lag1 <- acf_plot(simdat$Y, 
   split_by=list(Subject=simdat$Subject, Trial=simdat$Trial), 
   plot=FALSE)['1']

#---------------------------------------------
# When using model residuals
#---------------------------------------------

# add missing values to simdat:
simdat[sample(nrow(simdat), 15),]$Y <- NA
# simple linear model:
m1 <- lm(Y ~ Time, data=simdat)

## Not run: 
##D # This will generate an error:
##D acf_plot(resid(m1), split_by=list(simdat$Subject, simdat$Trial))
## End(Not run)
# This should work:
el.na <- missing_est(m1)
acf_plot(resid(m1), 
     split_by=list(simdat[-el.na,]$Subject, simdat[-el.na,]$Trial))

# This should also work:
simdat$res <- NA
simdat[!is.na(simdat$Y),]$res <- resid(m1)
acf_plot(simdat$res, split_by=list(simdat$Subject, simdat$Trial))

# see the vignette for examples:
vignette("acf", package="itsadug")




