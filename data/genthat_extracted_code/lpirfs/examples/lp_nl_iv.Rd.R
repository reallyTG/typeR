library(lpirfs)


### Name: lp_nl_iv
### Title: Compute nonlinear impulse responses with identified shock
### Aliases: lp_nl_iv

### ** Examples

## No test: 

# This example replicates results from the Supplementary Appendix
# by Ramey and Zubairy (2018) (RZ-18).

# Load and prepare data
 ag_data           <- ag_data
 sample_start      <- 7
 sample_end        <- dim(ag_data)[1]
 endog_data        <- ag_data[sample_start:sample_end, 3:5]

# The shock is estimated by RZ-18
 shock             <- ag_data[sample_start:sample_end, 7]

# Include four lags of the 7-quarter moving average growth rate of GDP
# as exogenous variables (see RZ-18)
 exog_data         <- ag_data[sample_start:sample_end, 6]

# Use the 7-quarter moving average growth rate of GDP as switching variable
# and adjust it to have suffiently long recession periods.
 switching_variable <- ag_data$GDP_MA[sample_start:sample_end] - 0.8

# Estimate local projections
 results_nl_iv <- lp_nl_iv(endog_data,
                           lags_endog_nl     = 3,
                           shock             = shock,
                           exog_data         = exog_data,
                           lags_exog         = 4,
                           contemp_data      = NULL,
                           lags_criterion    = NaN,
                           max_lags          = NaN,
                           trend             = 0,
                           confint           = 1.96,
                           hor               = 20,
                           switching         = switching_variable,
                           use_hp            = 0,
                           lambda            = NaN, # Ravn and Uhlig (2002):
                                                    # Annual data    = 6.25
                                                    # Quarterly data = 1600
                                                    # Monthly data   = 129,600
                           gamma             = 3,
                           num_cores         = NULL)

# Make and save plots
 plots_nl_iv <- plot_nl(results_nl_iv)

# Show single impulse responses
# Compare with red line of left plot (lower panel) in Figure 12 in Supplementary Appendix of RZ-18.
 plot(plots_nl_iv$gg_s1[[1]])
# Compare with blue line of left plot (lower panel) in Figure 12 in Supplementary Appendix of RZ-18.
 plot(plots_nl_iv$gg_s2[[1]])

# Show all impulse responses by using 'ggpubr' and 'gridExtra'
# lpirfs does not depend on those packages so they have to be installed
 library(ggpubr)
 library(gridExtra)

 s1_plots <- sapply(plots_nl_iv$gg_s1, ggplotGrob)
 s2_plots <- sapply(plots_nl_iv$gg_s2, ggplotGrob)

# Show all responses of state 1
 marrangeGrob(s1_plots, nrow = ncol(endog_data), ncol = 1, top = NULL)

# Show all responses of state 2
 marrangeGrob(s2_plots, nrow = ncol(endog_data), ncol = 1, top = NULL)

## End(No test)



