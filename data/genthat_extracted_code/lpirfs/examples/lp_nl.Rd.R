library(lpirfs)


### Name: lp_nl
### Title: Compute nonlinear impulse responses
### Aliases: lp_nl

### ** Examples

## No test: 

                  ## Example without exogenous variables ##

# Load package
  library(lpirfs)

# Load (endogenous) data
  endog_data <- interest_rules_var_data

# Choose data for switching variable (here Federal Funds Rate)
# Important: The switching variable does not have to be used within the VAR!
 switching_data <-  endog_data$Infl

# Estimate model and save results
  results_nl    <- lp_nl(endog_data,
                                lags_endog_lin  = 4,
                                lags_endog_nl   = 3,
                                lags_criterion  = NaN,
                                max_lags        = NaN,
                                trend           = 0,
                                shock_type      = 1,
                                confint         = 1.96,
                                hor             = 24,
                                switching       = switching_data,
                                use_hp          = TRUE,
                                lambda          = 1600,
                                gamma           = 3,
                                exog_data       = NULL,
                                lags_exog       = NULL,
                                contemp_data    = NULL,
                                num_cores       = NULL)

# Make and save all plots
  nl_plots <- plot_nl(results_nl)

# Show all impulse responses by using 'ggpubr' and 'gridExtra'
# lpirfs does not depend on those packages so they have to be installed
  library(ggpubr)
  library(gridExtra)

# Save plots based on states
  s1_plots <- sapply(nl_plots$gg_s1, ggplotGrob)
  s2_plots <- sapply(nl_plots$gg_s2, ggplotGrob)

# Show first irf of each state
  plot(s1_plots[[1]])
  plot(s2_plots[[1]])

# Show all plots
  marrangeGrob(s1_plots, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)
  marrangeGrob(s2_plots, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)


                     ## Example with exogenous variables ##

# Load (endogenous) data
  endog_data <- interest_rules_var_data

# Choose data for switching variable (here Federal Funds Rate)
# Important: The switching variable does not have to be used within the VAR!
 switching_data <-  endog_data$FF

# Create exogenous data and data with contemporaneous impact (for illustration purposes only)
 exog_data    <- endog_data$GDP_gap*endog_data$Infl*endog_data$FF + rnorm(dim(endog_data)[1])
 contemp_data <- endog_data$GDP_gap*endog_data$Infl*endog_data$FF + rnorm(dim(endog_data)[1])

# Exogenous data has to be a data.frame
 exog_data    <- data.frame(xx  = exog_data)
 contemp_data <- data.frame(cc  = contemp_data)

# Estimate model and save results
 results_nl <- lp_nl(endog_data,
                          lags_endog_lin  = 4,
                          lags_endog_nl   = 3,
                          lags_criterion  = NaN,
                          max_lags        = NaN,
                          trend           = 0,
                          shock_type      = 1,
                          confint         = 1.96,
                          hor             = 24,
                          switching       = switching_data,
                          use_hp          = TRUE,
                          lambda          = 1600, # Ravn and Uhlig (2002):
                                                  # Anuual data    = 6.25
                                                  # Quarterly data = 1600
                                                  # Monthly data   = 129 600
                          gamma           = 3,
                          exog_data       = exog_data,
                          lags_exog       = 3,
                          contemp_data    = NULL,
                          num_cores       = NULL)

# Make and save all plots
  nl_plots <- plot_nl(results_nl)

# Save plots based on states
  s1_plots <- sapply(nl_plots$gg_s1, ggplotGrob)
  s2_plots <- sapply(nl_plots$gg_s2, ggplotGrob)

# Show all plots
  marrangeGrob(s1_plots, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)
  marrangeGrob(s2_plots, nrow = ncol(endog_data), ncol = ncol(endog_data), top = NULL)



## End(No test)



