## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  screenshot.force = FALSE,
  comment = "#>"
)
library(weibulltools)

# set.seed() for reproducibility of random sampled id's
set.seed(2905)

## ----MRR all distributions, message = FALSE------------------------------
library(SPREDA) # for dataset shock
data(shock)
# generate random ids for units: 
shock$id <- sample(c(letters, LETTERS), size = nrow(shock), replace = FALSE)

# Rank Regression: 
# for rank_regression(), estimated failure probabilities are required: 
df_shock <- johnson_method(id = shock$id, x = shock$Distance, event = shock$Censor)

# Using all models which are provided in rank_regression: 
dists <- c("weibull", "lognormal", "loglogistic", "normal", "logistic", "sev", 
           "weibull3", "lognormal3", "loglogistic3")

mrr_list <- lapply(dists, rank_regression, x = df_shock$characteristic, 
                   y = df_shock$prob, event = df_shock$status)

r_sq_vec <- sapply(mrr_list, "[[", "r_squared")
names(r_sq_vec) <- dists
r_sq_vec

## ----MRR weibull, fig.cap = "Figure 1: Median Rank Regression using two-parameter Weibull.", message = FALSE----
# Again estimating weibull: 
mrr_weibull <- rank_regression(x = df_shock$characteristic, y = df_shock$prob,
                               event = df_shock$status, distribution = "weibull")
mrr_weibull 

# Probability plot: 
weibull_grid <- plot_prob(x = df_shock$characteristic, y = df_shock$prob, 
                          event = df_shock$status, id = df_shock$id, 
                          distribution = "weibull", 
                          title_main = "Weibull Probability Plot", 
                          title_x = "Mileage in km", 
                          title_y = "Probability of Failure in %",
                          title_trace = "Defect Shock Absorbers")

library(plotly) # pipe operator
# Add regression line: 
weibull_plot <- weibull_grid %>% 
  plot_mod(x = df_shock$characteristic, loc_sc_params = mrr_weibull$loc_sc_coefficients,
                             distribution = "weibull",
                             title_trace = "Median Rank Regression")
weibull_plot

## ----ML all distributions, message = FALSE-------------------------------
# Using all models which are provided in ml_estimation: 
ml_list <- lapply(dists, ml_estimation, x = df_shock$characteristic, 
                  event = df_shock$status)

loglik_vec <- sapply(ml_list, "[[", "logL")
names(loglik_vec) <- dists
loglik_vec

## ----ML weibull, fig.cap = "Figure 2: Comparison of Median Rank Regression and Maximum Likelihood.", message = FALSE----
# Again estimating weibull: 
ml_weibull <- ml_estimation(x = df_shock$characteristic, event = df_shock$status, 
                            distribution = "weibull")
ml_weibull 

# Add ML estimation to weibull_plot: 
## predict_prob to calculate CDF with ML-parameters:  
ml_prob <- predict_prob(q = seq(6200, 30600, length.out = 100), 
                        loc_sc_params = ml_weibull$loc_sc_coefficients, 
                        distribution = "weibull")

weibull_both <- weibull_plot %>% 
  add_lines(x = seq(6200, 30600, length.out = 100), y = SPREDA::qsev(ml_prob), 
            name = "Maximum Likelihood", color = I("#006400"), hoverinfo = "text", 
            text = ~paste(paste("\u03B7<sub>ML</sub>", ":", 
                                round(ml_weibull$coefficients[[1]], digits = 2)), 
                          "<br>", paste("\u03B2<sub>ML</sub>", ":", 
                                        round(ml_weibull$coefficients[[2]], digits = 2))))
weibull_both

## ----ML estimation Log-normal, message = FALSE---------------------------
# Data: 
cycles <- c(300, 300, 300, 300, 300, 291, 274, 271, 269, 257, 256, 227, 226,
            224, 213, 211, 205, 203, 197, 196, 190, 189, 188, 187, 184, 180,
            180, 177, 176, 173, 172, 171, 170, 170, 169, 168, 168, 162, 159,
            159, 159, 159, 152, 152, 149, 149, 144, 143, 141, 141, 140, 139,
            139, 136, 135, 133, 131, 129, 123, 121, 121, 118, 117, 117, 114,
            112, 108, 104, 99, 99, 96, 94)
state <- c(rep(0, 5), rep(1, 67))
id <- 1:length(cycles)

# Two-parameter Log-normal:  
ml_lognormal <- ml_estimation(x = cycles, event = state, 
                            distribution = "lognormal")
ml_lognormal

# Three-parameter Log-normal:  
ml_lognormal3 <- ml_estimation(x = cycles, event = state, 
                            distribution = "lognormal3")
ml_lognormal3


## ----ML visualization I, fig.cap = "Figure 3: Three-parametric Log-normal distribution.", message = FALSE----
# Constructing probability plot: 
df_alloy <- johnson_method(x = cycles, event = state, id = id)
lognormal_grid <- plot_prob(x = df_alloy$characteristic, y = df_alloy$prob, 
                            event = df_alloy$status, id = df_alloy$id, 
                            distribution = "lognormal", 
                            title_main = "Log-normal Probability Plot", 
                            title_x = "Cycles", 
                            title_y = "Probability of Failure in %",
                            title_trace = "Failed Units")

# Add three-parametric model to grid: 
lognormal_plot <- lognormal_grid %>% 
  plot_mod(x = df_alloy$characteristic, loc_sc_params = ml_lognormal3$loc_sc_coefficients,
                             distribution = "lognormal3",
                             title_trace = "Three-parametric Log-normal")
lognormal_plot

## ----ML visualization II, fig.cap = "Figure 4: Comparison of two- and three-parametric Log-normal distribution.", message = FALSE----
# Add two-parametric model to lognormal_plot: 
## predict_prob to calculate CDF with ML-parameters:  
ml_prob_lognormal <- predict_prob(q = seq(85, 325, length.out = 100),
                        loc_sc_params = ml_lognormal$loc_sc_coefficients,
                        distribution = "lognormal")

lognormal_both <- lognormal_plot %>%
  add_lines(x = seq(85, 325, length.out = 100), y = qnorm(ml_prob_lognormal),
            name = "Two-parametric Log-normal", color = I("#006400"), hoverinfo = "text",
            text = ~paste(paste("\u03BC<sub>ML</sub>", ":",
                                round(ml_lognormal$loc_sc_coefficients[[1]], digits = 2)),
                          "<br>", paste("\u03C3<sub>ML</sub>", ":",
                                        round(ml_lognormal$loc_sc_coefficients[[2]], digits = 2))))
lognormal_both

