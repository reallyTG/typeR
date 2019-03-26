library(lpirfs)


### Name: lp_lin_iv
### Title: Compute linear impulse responses with identified shock and/or
###   with 2SLS
### Aliases: lp_lin_iv

### ** Examples

## No test: 

# This example replicates a result from the Supplementary Appendix
# by Ramey and Zubairy (2018) (RZ-18)

# Load data
 ag_data       <- ag_data
 sample_start  <- 7
 sample_end    <- dim(ag_data)[1]

# Endogenous data
 endog_data    <- ag_data[sample_start:sample_end,3:5]

# Variable to shock with. Here government spending due to
# Blanchard and Perotti (2002) framework
 shock         <- ag_data[sample_start:sample_end, 3]

# Estimate linear model
 results_lin_iv <- lp_lin_iv(endog_data,
                               lags_endog_lin = 4,
                               shock          = shock,
                               exog_data      = NULL,
                               lags_exog      = NULL,
                               contemp_data   = NULL,
                               lags_criterion = NaN,
                               max_lags       = NaN,
                               trend          = 0,
                               confint        = 1.96,
                               hor            = 20,
                               num_cores      = NULL)


# Make and save plots
 iv_lin_plots    <- plot_lin(results_lin_iv)

# * The first element of 'iv_lin_plots' shows the response of the first
#   variable (Gov) to the  shock (Gov).
# * The second element of 'iv_lin_plots' shows the response of the second
#   variable (Tax) to the shock (Gov).
# * ...

# This plot replicates the left plot in the mid-panel of Figure 12 in the
# Supplementary Appendix by RZ-18.
 iv_lin_plots[[1]]

# Show all impulse responses by using 'ggpubr' and 'gridExtra'
# lpirfs does not depend on those packages so they have to be installed
 library(ggpubr)
 library(gridExtra)

 lin_plots_all <- sapply(iv_lin_plots, ggplotGrob)
 marrangeGrob(lin_plots_all, nrow = ncol(endog_data), ncol = 1, top = NULL)


## Add lags of the identified shock ##

# Endogenous data but now exclude government spending
 endog_data    <- ag_data[sample_start:sample_end, 4:5]

# Variable to shock with (government spending)
 shock         <- ag_data[sample_start:sample_end, 3]

# Add the shock variable to exogenous data
 exog_data     <- shock

# Estimate linear model with lagged shock variable
 results_lin_iv <- lp_lin_iv(endog_data,
                               lags_endog_lin = 4,
                               shock          = shock,
                               exog_data      = exog_data,
                               lags_exog      = 2,
                               contemp_data   = NULL,
                               lags_criterion = NaN,
                               max_lags       = NaN,
                               trend          = 0,
                               confint        = 1.96,
                               hor            = 20,
                               num_cores      = NULL)


# Make and save plots
 iv_lin_plots    <- plot_lin(results_lin_iv)
 lin_plots_all   <- sapply(iv_lin_plots, ggplotGrob)
 marrangeGrob(lin_plots_all, nrow = ncol(endog_data), ncol = 1, top = NULL)


##############################################################################
#####                         Use 2SLS                               #########
##############################################################################

# Set seed
 set.seed(007)

# Load data
 ag_data       <- ag_data
 sample_start  <- 7
 sample_end    <- dim(ag_data)[1]

# Endogenous data
 endog_data    <- ag_data[sample_start:sample_end,3:5]

# Variable to shock with (government spending)
 shock         <- ag_data[sample_start:sample_end, 3]

# Generate instrument variable that is correlated with government spending
 instrum       <- as.data.frame(0.9*shock$Gov + rnorm(length(shock$Gov), 0, 0.02) )

# Estimate linear model via SLS
 results_lin_iv <- lp_lin_iv(endog_data,
                            lags_endog_lin = 4,
                            shock          = shock,
                            instrum        = instrum,
                            twosls         = TRUE,
                            exog_data      = NULL,
                            lags_exog      = NULL,
                            contemp_data   = NULL,
                            lags_criterion = NaN,
                            max_lags       = NaN,
                            trend          = 0,
                            confint        = 1.96,
                            hor            = 20,
                            num_cores      = NULL)

# Create all plots
 iv_lin_plots    <- plot_lin(results_lin_iv)


# Show response of GDP
 iv_lin_plots[[3]]
## End(No test)





