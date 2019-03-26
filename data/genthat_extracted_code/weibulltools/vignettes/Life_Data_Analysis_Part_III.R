## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  screenshot.force = FALSE,
  comment = "#>"
)
library(weibulltools)

## ----probability plot weibull, fig.cap = "Figure 1: Plotting positions in weibull grid.", message = FALSE----
# Data: 
hours <- c(2, 28, 67, 119, 179, 236, 282, 317, 348, 387, 3, 31, 69, 135,
           191, 241, 284, 318, 348, 392, 5, 31, 76, 144, 203, 257, 286,
           320, 350, 412, 8, 52, 78, 157, 211, 261, 298, 327, 360, 446,
           13, 53, 104, 160, 221, 264, 303, 328, 369, 21, 64, 113, 168,
           226, 278, 314, 328, 377)

state <- c(1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1,
           1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0,
           1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
           0, 1, 1, 1, 1, 1, 1)

id <- 1:length(hours)

# Estimating failure probabilities: 
df_john <- johnson_method(id = id, x = hours, event = state)

# Probability plot: 
weibull_plot <- plot_prob(x = df_john$characteristic, y = df_john$prob, 
                          event = df_john$status, id = df_john$id, 
                          distribution = "weibull", 
                          title_main = "Weibull Probability Plot", 
                          title_x = "Time in Hours", 
                          title_y = "Probability of Failure in %",
                          title_trace = "Defect Items")
weibull_plot

## ----segmented weibull I, fig.cap = "Figure 2: Subgroup-specific plotting positions.", message = FALSE----
# Applying mixmod_regression(): 
mixreg_weib <- mixmod_regression(x = df_john$characteristic, y = df_john$prob, 
  event = df_john$status, distribution = "weibull")

# Using plot_prob_mix(). 
mix_reg_plot <- plot_prob_mix(x = hours, event = state, id = id, 
  distribution = "weibull", mix_output = mixreg_weib, 
  title_main = "Weibull Mixture Regression", title_x = "Time in Hours", 
  title_y = "Probability of Failure", title_trace = "Subgroup")
mix_reg_plot

## ----segmented weibull II, fig.cap = "Figure 3: Subgroup-specific regression lines.", message = FALSE----
# Using plot_mod_mix() to visualize regression lines of subgroups: 
mix_reg_lines <- plot_mod_mix(mix_reg_plot, x = hours, event = state, 
  mix_output = mixreg_weib, distribution = "weibull", title_trace = "Fitted Line")
mix_reg_lines

## ----em weibull I, fig.cap = "Figure 4: Subgroup-specific plotting positions.", message = FALSE----
# Applying mixmod_regression(): 
mixem_weib <- mixmod_em(x = hours, event = state, distribution = "weibull",
                        conf_level = 0.95, k = 2, method = "EM", n_iter = 150)

# Using plot_prob_mix(): 
mix_em_plot <- plot_prob_mix(x = hours, event = state, id = id, 
  distribution = "weibull", mix_output = mixem_weib, 
  title_main = "Weibull Mixture EM", title_x = "Time in Hours", 
  title_y = "Probability of Failure", title_trace = "Subgroup")
mix_em_plot

## ----em weibull II, fig.cap = "Figure 5: Subgroup-specific regression lines.", message = FALSE----

# Using plot_mod_mix() to visualize regression lines of subgroups: 
mix_em_lines <- plot_mod_mix(mix_em_plot, x = hours, event = state, 
  mix_output = mixem_weib, distribution = "weibull", title_trace = "Fitted Line")
mix_em_lines

