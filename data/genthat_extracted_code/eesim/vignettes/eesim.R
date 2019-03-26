## ---- echo = FALSE, message = FALSE--------------------------------------
library(eesim)
library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)

## ----message = FALSE, echo = FALSE, fig.width = 5, fig.align = "center"----
library(dlnm)
data("chicagoNMMAPS")
chicagoNMMAPS %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% 
  select(date, cvd, o3) %>% 
  rename(`Cardiovascular deaths` = cvd,
         `Ozone concentration (ppb)` = o3) %>% 
  gather(variable, value, -date) %>% 
  ggplot(aes(x = date, y = value)) + 
  geom_point(alpha = 0.5, size = 1) + 
  geom_smooth(se = FALSE, span = 0.1, method = "loess", color = "red") +
  facet_wrap(~ variable, ncol = 1, scales = "free_y") + 
  theme_classic() + 
  labs(x = "Date", y = "Variable value")

## ----message = FALSE, echo = FALSE, results='hide'-----------------------
chicagoNMMAPS %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% 
  select(date, cvd, o3) %>% 
  gather(variable, value, -date) %>% 
  group_by(variable) %>% 
  summarize(mean = mean(value, na.rm = TRUE),
            sd = sd(value, na.rm = TRUE))

library(splines)
a <- chicagoNMMAPS %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% select(date, o3)
mod <- lm(o3 ~ ns(scale(time, scale = FALSE, center = TRUE), 7 * 14), data = chicagoNMMAPS)
sd(residuals(mod))

## ---- warning = FALSE, message = FALSE-----------------------------------
sim_chicago <- create_sims(n_reps = 1, n = 365 * 5, central = 20, sd = 7,
                           exposure_type = "continuous", exposure_trend = "cos1",
                           exposure_amp = -.6, average_outcome = 50,
                           outcome_trend = "cos1", outcome_amp = 0.2, 
                           rr = 1.0005, start.date = "1996-01-01")
head(sim_chicago[[1]])

## ----echo = FALSE, message = FALSE, echo = FALSE, fig.width = 5, fig.align = "center"----
sim_chicago[[1]] %>% 
  rename(Exposure = x,
         Outcome = outcome) %>% 
  gather(variable, value, -date) %>% 
  mutate(variable = factor(variable, levels = c("Outcome", "Exposure"))) %>% 
  ggplot(aes(x = date, y = value)) + 
  geom_point(alpha = 0.5, size = 1) + 
  facet_wrap(~ variable, ncol = 1, scales = "free_y") + 
  theme_classic() + 
  geom_smooth(se = FALSE, method = "loess", color = "red", span = 0.1)

## ----fig.align = "center", fig.width = 8, fig.height = 7.5---------------
a <- calendar_plot(sim_chicago[[1]] %>% select(date, outcome), type = "continuous", 
                   legend_name = "Outcome") + 
  ggtitle("Outcome")
b <- calendar_plot(sim_chicago[[1]] %>% select(date, x), type = "continuous") + 
  ggtitle("Exposure")
grid.arrange(a, b, ncol = 1)

## ----echo = FALSE--------------------------------------------------------
set.seed(16)

## ---- warning = FALSE, message = FALSE-----------------------------------
ex_sim <- eesim(n_reps = 100, n = 365 * 5, central = 20, sd = 7,
                exposure_type = "continuous", exposure_trend = "cos1",
                exposure_amp = -.6, average_outcome = 50,
                outcome_trend = "cos1", outcome_amp = 0.2, 
                rr = 1.2, start.date = "1996-01-01",
                custom_model = spline_mod, custom_model_args = list(df_year = 7))

## ------------------------------------------------------------------------
names(ex_sim)

## ----fig.height = 3, fig.width = 7, fig.align = "center"-----------------
calendar_plot(ex_sim[["simulated_datasets"]][[1]] %>% select(date, x), type = "continuous")

## ------------------------------------------------------------------------
head(ex_sim[["indiv_performance"]])

## ----fig.width = 4, fig.height = 5, fig.align = "center"-----------------
coverage_plot(ex_sim[["indiv_performance"]], true_param = 1.2)

## ----echo = FALSE--------------------------------------------------------
eesim_overall_output <- data_frame(element = paste0("`",
                                                    colnames(ex_sim[[3]]),
                                                    "`"),
                                   desc = c("**Mean estimate**: The mean of the estimated log relative rate over all simulations.",
                                            "**Mean estimated relative rate**: The mean of the estimated relative rate over all simulations.",
                                            "**Variance across estimates**: Variance of the point estimates (estimated log relative risk) over all simulations.",
                                            "**Mean variance of estimate**: The mean of the variances of the estimated effect (estimated log relative risk) across all simulations.",
                                            "**Relative bias**: Difference between the estimated log relative risk and true log relative risk as a proportion of the true log relative risk.",
                                            "**95% confidence inverval coverage**: Percent of simulations for which the 95% confidence interval estimate of log relative risk includes the true value of log relative risk.",
                                            "**Power**: Percent of simulations for which the null hypothesis that the log relative risk equals zero is rejected based on a p-value of 0.05."))
knitr::kable(eesim_overall_output, col.names = c("Variable", "Description"))

## ------------------------------------------------------------------------
ex_sim[["overall_performance"]]

## ----echo = FALSE, message = FALSE, echo = FALSE, fig.width = 5, fig.align = "center", fig.height = 2----
chicagoNMMAPS %>% 
  mutate(temp = temp >= quantile(temp, probs = 0.98)) %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% 
  select(date, temp) %>% 
  rename(`Extreme heat day` = temp) %>% 
  gather(variable, value, -date) %>% 
  ggplot(aes(x = date, y = value)) + 
  geom_jitter(alpha = 0.5, size = 0.7, fill = NA, width = 0, height = 0.1) + 
  facet_wrap(~ variable, ncol = 1, scales = "free_y") + 
  theme_classic() + 
  labs(x = "Date", y = "Variable value")

## ----echo = FALSE, results="hide"----------------------------------------
chicagoNMMAPS %>% 
  mutate(temp = temp >= quantile(temp, probs = 0.98)) %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% 
  group_by(month) %>% 
  summarize(p_heat = mean(temp))

## ------------------------------------------------------------------------
sim_chicago2 <- create_sims(n_reps = 1, n = 365 * 5, sd = 1,
                            central = c(0, 0, 0, 0, 0, 0.05, 0.12, 0.02, 0, 0, 0, 0),
                            exposure_type = "binary", exposure_trend = "monthly",
                            exposure_amp = -.6, average_outcome = 50,
                            outcome_trend = "cos1", outcome_amp = 0.2, 
                            rr = 1.05, start.date = "1996-01-01")

## ----echo = FALSE, message = FALSE, echo = FALSE, fig.width = 5, fig.align = "center", fig.height = 2----
sim_chicago2[[1]] %>% 
  select(date, x) %>% 
  rename(`Extreme heat day` = x) %>% 
  gather(variable, value, -date) %>% 
  ggplot(aes(x = date, y = value)) + 
  geom_jitter(alpha = 0.5, size = 0.7, fill = NA, width = 0, height = 0.1) + 
  facet_wrap(~ variable, ncol = 1, scales = "free_y") + 
  theme_classic() + 
  labs(x = "Date", y = "Variable value")

## ----fig.align = "center", fig.width = 8, fig.height = 7-----------------
a <- chicagoNMMAPS %>% 
  mutate(temp = temp >= quantile(temp, probs = 0.98)) %>% 
  tbl_df() %>% 
  filter(year >= 1996) %>% 
  select(date, temp) %>% 
  calendar_plot(type = "discrete", labels = c("Extreme heat day", "Other day")) + 
  ggtitle("Observed exposure data")
b <- sim_chicago2[[1]] %>% 
  select(date, x) %>% 
  calendar_plot(type = "discrete", labels = c("Extreme heat day", "Other day")) + 
  ggtitle("Simulated exposure data")
grid.arrange(a, b, ncol = 1)

## ----echo = FALSE--------------------------------------------------------
set.seed(2416)

## ------------------------------------------------------------------------
ex_sim2 <- eesim(n_reps = 100, n = 365 * 5, 
                 central = c(0, 0, 0, 0, 0, 0.05, 0.12, 0.02, 0, 0, 0, 0),
                 exposure_type = "binary", exposure_trend = "monthly",
                 exposure_amp = -.6, average_outcome = 50,
                 outcome_trend = "cos1", outcome_amp = 0.2, 
                 rr = 1.05, start.date = "1996-01-01",
                 custom_model = spline_mod, custom_model_args = list(df_year = 7))

## ----fig.width = 4, fig.height = 5, fig.align = "center"-----------------
coverage_plot(ex_sim2[["indiv_performance"]], true_param = 1.05)

## ------------------------------------------------------------------------
ex_sim2[["overall_performance"]]

## ----fig.width = 5, fig.height = 3.5, fig.align = "center"---------------
ex_power_calc <- power_calc(varying = "n", values = floor(365.25 * seq(1, 20, by = 5)),
                            n_reps = 100, rr = 1.05,
                            central = c(0, 0, 0, 0, 0, 0.05, 0.12, 0.02, 0, 0, 0, 0),
                            exposure_type = "binary", exposure_trend = "monthly", 
                            exposure_amp = -.6, average_outcome = 50,
                            outcome_trend = "cos1", outcome_amp = 0.2, 
                            custom_model = spline_mod, custom_model_args = list(df_year = 7),
                            plot = FALSE)
ex_power_calc %>% 
  ggplot(aes(x = values, y = power)) + 
  geom_line() + 
  ylim(0, 1) + 
  labs(x = "Number of days in the study", y = "Power") + 
  theme_bw()

## ------------------------------------------------------------------------
x_cont <- sim_exposure(n = 1000, central = 50, sd = 5, exposure_type = "continuous") 
x_cont %>% slice(1:5)

## ----fig.width = 4, fig.height = 2, fig.align = "center"-----------------
ggplot(x_cont, aes(x = date, y = x)) + geom_point(alpha = 0.2) + 
  theme_classic()

## ----fig.align = "center", fig.width = 8, fig.height = 2.5---------------
calendar_plot(x_cont, type = "continuous")

## ------------------------------------------------------------------------
x_bin <- sim_exposure(n = 1000, central = 0.05, exposure_type = "binary")
x_bin %>% slice(1:5)

## ----fig.align = "center", fig.width = 8, fig.height = 2.25--------------
calendar_plot(x_bin, type = "discrete", labels = c("Not exposed", "Exposed"))

## ----fig.width = 7, fig.height = 4, echo = FALSE, message = FALSE--------
data.frame(day = 1:1000) %>%
  mutate(`"no trend"` = calc_t(n = 1000, trend = "no trend"),
         `"cos1"` = calc_t(n = 1000, trend = "cos1"),
         `"cos2"` = calc_t(n = 1000, trend = "cos2"),
         `"cos3"` = calc_t(n = 1000, trend = "cos3"),
         `"linear"` = calc_t(n = 1000, trend = "linear"),
         `"curvilinear"` = calc_t(n = 1000, trend = "curvilinear"),
         `"cos1linear"` = calc_t(n = 1000, trend = "cos1linear")) %>%
  gather(trend_method, trend_value, -day) %>%
  mutate(trend_method = factor(trend_method,
                               levels = c('"no trend"', 
                                          '"linear"',
                                          '"curvilinear"',
                                          '"cos1"',
                                          '"cos1linear"',
                                          '"cos2"',
                                          '"cos3"'))) %>%
  ggplot(aes(x = day, y = trend_value)) + 
  geom_line() + facet_wrap(~ trend_method, ncol = 4) + 
  theme_bw()

## ----fig.width = 7, fig.height = 2, echo = FALSE, message = FALSE--------
data.frame(day = 1:1000) %>%
  mutate(`"amp = 0.5"` = calc_t(n = 1000, trend = "cos1linear", amp = 0.5),
         `"amp = 0.1"` = calc_t(n = 1000, trend = "cos1linear", amp = 0.1),
         `"amp = 0.9"` = calc_t(n = 1000, trend = "cos1linear", amp = 0.9),
         `"amp = -0.5"` = calc_t(n = 1000, trend = "cos1linear", amp = -0.5)) %>%
  gather(trend_method, trend_value, -day) %>%
  ggplot(aes(x = day, y = trend_value)) + 
  geom_line() + facet_wrap(~ trend_method, ncol = 4) + 
  theme_bw()

## ---- fig.width = 5.5, fig.height = 5, fig.align = "center"--------------
testexp <- sim_exposure(n = 365 * 3, central = 50, sd = 10, trend = "cos1linear",
                        exposure_type = "continuous")
a <- ggplot(testexp, aes(x = date, y = x)) +  
  geom_point(alpha = 0.5, size = 0.8) + 
  coord_cartesian(ylim = c(0,110)) + 
  labs(title = "Exposure with a 'cos1linear' trend", x = "Date", y="Exposure") + 
  theme_classic()
b <- calendar_plot(testexp, type = "continuous") + 
  ggtitle("Calendar plot of simulated exposure data") + 
  theme(legend.position = "bottom")
grid.arrange(a, b, ncol = 1)

## ---- fig.width = 5.5, fig.height = 5,  fig.align = "center"-------------
small_amp <- sim_exposure(n = 365 * 3, central = 50, sd = 10, trend = "cos1linear",
                        amp = -0.3, exposure_type = "continuous")
a <- ggplot(small_amp, aes(x = date, y = x)) +  
  geom_point(alpha = 0.5, size = 0.8) + 
  coord_cartesian(ylim = c(0,110)) + 
  labs(title = "Exposure with a 'cos1linear' trend", x = "Date", y="Exposure") + 
  theme_classic()
b <- calendar_plot(small_amp, type = "continuous") + 
  ggtitle("Calendar plot of simulated exposure data") + 
  theme(legend.position = "bottom")
grid.arrange(a, b, ncol = 1)

## ---- message = FALSE, fig.width = 5.5, fig.height = 5,  fig.align = "center"----
testbin <- sim_exposure(n=1000, central = c(.05, .05, .1, .2, .4, .4, .5, .7, .5, .2, .1, .05),
                        trend = "monthly", exposure_type = "binary", 
                        start.date = "2002-06-01")
a <- testbin %>% 
  mutate(x = factor(x, levels = c(0, 1), labels = c("Not exposed", "Exposed"))) %>% 
  ggplot(aes(x = date, y = x)) + 
  geom_jitter(alpha = 0.5, size = 0.7, fill = NA, width = 0, height = 0.1) + 
  theme_classic() + 
  labs(x = "Date", y = "Exposure")
b <- calendar_plot(testbin, type = "discrete", labels = c("Not exposed", "Exposed")) + 
  ggtitle("Calendar plot of simulated exposure data") + 
  theme(legend.position = "bottom")
grid.arrange(a, b, ncol = 1)

## ----echo = FALSE, fig.width = 8, fig.height = 3-------------------------
continuous_trend <- data_frame(t = calc_t(n = 1000, trend = "cos1")) %>% 
  mutate(x = 100 * t,
         date = seq(from = as.Date("2000-01-01"),
                    by = 1, length.out = 1000)) 
a <- continuous_trend %>%
  ggplot(aes(x = date, y = x)) + geom_line(color = "red") + theme_classic() + 
  ylim(c(0, 200))

continuous_simulated <- continuous_exposure(n = 1000, mu = 100,
                                            sd = 10, trend = "cos1") 
b <- continuous_simulated %>%
  ggplot(aes(x = date, y = x)) + geom_point() + 
  geom_line(data = continuous_trend, color = "red") + theme_classic() + 
  ylim(c(0, 200))

grid.arrange(a, b, ncol = 2)

## ------------------------------------------------------------------------
testexp2 <- sim_exposure(n = 1000, central = 100, sd = 10, trend = "cos1",
                         exposure_type = "continuous")
testout <- sim_outcome(exposure = testexp2, average_outcome = 22,
                       trend = "linear", rr = 1.01)

## ----echo = FALSE, fig.width = 5.5, fig.height = 5, fig.align = "center"----
a <- ggplot(testout, aes(x = date, y = outcome)) + 
  geom_point(alpha = 0.5, size = 0.8) +
  labs(title = "Health outcomes with a linear trend", x = "Date", y = "Outcome") + 
  theme_classic()
b <- calendar_plot(testout %>% select(date, outcome), type = "continuous", 
                   legend_name = "Outcome") + 
  theme(legend.position = "bottom") + 
  ggtitle("Calendar plot of simulated outcome data")
grid.arrange(a, b, ncol = 1)

## ------------------------------------------------------------------------
spline_mod

## ------------------------------------------------------------------------
# Create simulated data
sims <- create_sims(n_reps = 10, n = 100, central = 100, sd = 10,
             exposure_type="continuous", exposure_trend = "cos1",
             exposure_amp = .6, average_outcome = 22,
             outcome_trend = "no trend", outcome_amp = .6, rr = 1.01)
head(sims[[1]])

## ------------------------------------------------------------------------
# Apply `spline_mod` to the data
spline_mod(df = sims[[1]])
spline_mod(df = sims[[1]], df_year = 6)

## ----eval = FALSE--------------------------------------------------------
#  ex_sim2 <- eesim(n_reps = 100, n = 365 * 5,
#                   central = c(0, 0, 0, 0, 0, 0.05, 0.12, 0.02, 0, 0, 0, 0),
#                   exposure_type = "binary", exposure_trend = "monthly",
#                   exposure_amp = -.6, average_outcome = 50,
#                   outcome_trend = "cos1", outcome_amp = 0.2,
#                   rr = 1.05, start.date = "1996-01-01",
#                   custom_model = spline_mod, custom_model_args = list(df_year = 7))

## ------------------------------------------------------------------------
fits <- fit_mods(data = sims, custom_model = spline_mod, 
                 custom_model_args = list(df_year = 7))
fits

## ------------------------------------------------------------------------
check_sims(fits, true_rr = 1.01)

## ----fig.align = "center", fig.width = 5, fig.height = 3-----------------
pow <- power_calc(varying = "n", values = floor(365.25 * seq(1, 21, by = 5)), n_reps = 20,
                  central = 100, sd = 10, rr = 1.001, exposure_type = "continuous",
                  exposure_trend = "cos1", exposure_amp = .6, average_outcome = 22,
                  outcome_trend = "no trend", outcome_amp = .6,
                  custom_model = spline_mod, plot = TRUE)

## ------------------------------------------------------------------------
pow

## ----fig.align = "center", fig.width = 5, fig.height = 3-----------------
pow2 <- power_calc(varying = "average_outcome", values = c(1, 5, 10, 20, 30, 40),
                   n_reps = 20,
                   central = 100, sd = 10, rr = 1.001, exposure_type = "continuous",
                   exposure_trend = "cos1", exposure_amp = .6, n = 4000,
                   outcome_trend = "no trend", outcome_amp = .6,
                   custom_model = spline_mod, plot = TRUE)

## ------------------------------------------------------------------------
pow2

## ------------------------------------------------------------------------
above_min_trend <- function(n, mean, sd_of_sqrt, minimum = 0){
  day <- c(1:n)
  
  ## Calculate a baseline exposure for each day
  base <- mean + -10 * cos(2 * pi * (day / 365))
  base[base < minimum] <- minimum            # Reset any values below 0 to 0
  
  ## Simulate exposure values from the baseline
  sqrt_base <- sqrt(base)                   # Transform to square root
  sqrt_sim <- rnorm(n, mean = sqrt_base, sd = sd_of_sqrt)
  sqrt_sim ^ 2                              # Transform back
}

## ----fig.width = 5, fig.height = 2, fig.align = "center"-----------------
above_min_trend(n = 365.25 * 5, mean = 20, minimum = 0, sd_of_sqrt = 0.9) %>% 
  tbl_df() %>% 
  mutate(day = 1:n()) %>% 
  ggplot(aes(x = day, y = value)) + 
  geom_point(alpha = 0.5, size = 0.8) + 
  theme_classic() + 
  geom_smooth(se = FALSE, span = 0.1, method = "loess", color = "red")

## ----message = FALSE-----------------------------------------------------
ex_sim2 <- eesim(n_reps = 1, n = round(365.25 * 5), 
                 exposure_type = "continuous",
                 cust_exp_func = above_min_trend,
                 cust_exp_args = list(mean = 20, minimum = 0, sd_of_sqrt = 0.9),
                 average_outcome = 50, rr = 1.01, 
                 custom_model = spline_mod, custom_model_args = list(df_year = 7))

## ----fig.width = 5, fig.height = 2, fig.align = "center"-----------------
custombase <- function(n, slope, intercept){
  day <- c(1:n)
  baseline <- day * slope + intercept
  return(baseline)
}

#Example:
custombase(n=5, slope = .3, intercept = 55)

ex_sim3 <- eesim(n_reps = 3, n = 1000, central = 100, sd = 10,
                exposure_type = "continuous", exposure_trend = "cos1",
                exposure_amp = .6, average_outcome = 22, rr = 1.01, 
                cust_base_func = custombase,
                cust_base_args = list(n=1000, slope = 5, intercept = 12),
                custom_model = spline_mod, custom_model_args = list(df_year = 2))
ggplot(ex_sim3$simulated_datasets[[1]], aes(x=date, y=outcome))+ geom_point() + geom_point(alpha = 0.5, size = 0.8) + 
  theme_classic() + 
  geom_smooth(se = FALSE, span = 0.1, method = "loess", color = "red")


## ---- warning = F--------------------------------------------------------
customlambda <- function(exposure, rr, constant, baseline){
  log_lambda <- log(baseline) + log(rr) * exposure + constant
  lambda <- exp(log_lambda)
  return(lambda)
}

ex_sim4 <- eesim(n_reps = 3, n = 1000, central = 100, sd = 10,
                exposure_type = "continuous", exposure_trend = "cos1",
                exposure_amp = .6, average_outcome = 22, rr = 1.01, 
                cust_base_func = custombase,
                cust_base_args = list(n=1000, slope = .5, intercept = 12),
                cust_lambda_func = customlambda, cust_lambda_args = list(constant=10),
                custom_model = spline_mod, custom_model_args = list(df_year = 2))

## ------------------------------------------------------------------------
custnbinom <- function(n, lambda, prob){
  out <- rnbinom(n=n, size=lambda, prob=prob)
  return(out)
}

ex_sim5 <- eesim(n_reps = 3, n = 1000, central = 100, sd = 10,
                exposure_type = "continuous", exposure_trend = "cos1",
                exposure_amp = .6, average_outcome = 22, rr = 1.01, 
                cust_base_func = custombase,
                cust_base_args = list(n=1000, slope = .5, intercept = 12),
                cust_lambda_func = customlambda, cust_lambda_args = list(constant=10),
                cust_outdraw = custnbinom, cust_outdraw_args = list(prob=.3), 
                custom_model = spline_mod, custom_model_args = list(df_year = 2))

