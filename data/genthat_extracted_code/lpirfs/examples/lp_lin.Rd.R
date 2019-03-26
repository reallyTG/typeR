library(lpirfs)


### Name: lp_lin
### Title: Compute linear impulse responses
### Aliases: lp_lin

### ** Examples

## No test: 

          ## Example without exogenous variables

# Load package
  library(lpirfs)

# Load (endogenous) data
  endog_data <- interest_rules_var_data

# Estimate linear model
  results_lin <- lp_lin(endog_data,
                             lags_endog_lin = 4,
                             exog_data      = NULL,
                             lags_exog      = NULL,
                             lags_criterion = NaN,
                             max_lags       = NaN,
                             trend          = 0,
                             shock_type     = 1,
                             confint        = 1.96,
                             hor            = 12,
                             contemp_data   = NULL,
                             num_cores      = NULL)

# Make plots
 linear_plots <- plot_lin(results_lin)

# Show single plots
 # * The first element of 'linear_plots' shows the response of the first
 #   variable (GDP_gap) to a shock in the first variable (GDP_gap).
 # * The second element of 'linear_plots' shows the response of the first
 #   variable (GDP_gap) to a shock in the second variable (inflation).
 # * ...

  linear_plots[[1]]
  linear_plots[[2]]

# Show all plots by using 'ggpubr' and 'gridExtra'
# lpirfs does not depend on those packages so they have to be installed
 library(ggpubr)
 library(gridExtra)

# Compare with Figure 5 in Jordà (2005)
 lin_plots_all <- sapply(linear_plots, ggplotGrob)
 marrangeGrob(lin_plots_all, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)


                      ## Example with exogenous variables ##

# Load (endogenous) data
 endog_data <- interest_rules_var_data

# Create exogenous data and data with contemporaneous impact (for illustration purposes only)
 exog_data    <- endog_data$GDP_gap*endog_data$Infl*endog_data$FF + rnorm(dim(endog_data)[1])
 contemp_data <- endog_data$GDP_gap*endog_data$Infl*endog_data$FF + rnorm(dim(endog_data)[1])

# Exogenous data has to be a data.frame
 exog_data    <- data.frame(xx = exog_data )
 contemp_data <- data.frame(cc =  contemp_data)

# Estimate linear model
  results_lin <- lp_lin(endog_data,
                               lags_endog_lin = 4,
                               lags_criterion = NaN,
                               max_lags       = NaN,
                               trend          = 0,
                               shock_type     = 1,
                               confint        = 1.96,
                               hor            = 12,
                               exog_data      = exog_data,
                               lags_exog      = 4,
                               contemp_data   = contemp_data,
                               num_cores      = NULL)

# Make plots
 linear_plots <- plot_lin(results_lin)

# Show all plots
 library(ggpubr)
 library(gridExtra)

 lin_plots_all <- sapply(linear_plots, ggplotGrob)
 marrangeGrob(lin_plots_all, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)


 
## End(No test)



