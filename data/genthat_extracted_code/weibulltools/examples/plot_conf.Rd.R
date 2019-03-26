library(weibulltools)


### Name: plot_conf
### Title: Add Confidence Region(s) for Quantiles or Probabilities
### Aliases: plot_conf

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
id <- LETTERS[1:length(obs)]

df_john <- johnson_method(x = obs, event = state, id = id)
mrr <- rank_regression(x = df_john$characteristic,
                       y = df_john$prob,
                       event = df_john$status,
                       distribution = "weibull",
                       conf_level = .95)
conf_betabin <- confint_betabinom(x = df_john$characteristic,
                                  event = df_john$status,
                                  loc_sc_params = mrr$loc_sc_coefficients,
                                  distribution = "weibull",
                                  bounds = "two_sided",
                                  conf_level = 0.95,
                                  direction = "y")

plot_weibull <- plot_prob(x = df_john$characteristic,
                          y = df_john$prob,
                          event = df_john$status,
                          id = df_john$id,
                          distribution = "weibull",
                          title_main = "Weibull Analysis",
                          title_x = "Mileage in miles",
                          title_y = "Probability of Failure",
                          title_trace = "Failed Items")
plot_reg_weibull <- plot_mod(p_obj = plot_weibull,
                             x = conf_betabin$characteristic,
                             y = conf_betabin$prob,
                             loc_sc_params = mrr$loc_sc_coefficients,
                             distribution = "weibull",
                             title_trace = "Estimated Weibull CDF")
plot_conf_beta <- plot_conf(p_obj = plot_reg_weibull,
                            x = list(conf_betabin$characteristic),
                            y = list(conf_betabin$lower_bound,
                                     conf_betabin$upper_bound),
                            direction = "y",
                            distribution = "weibull",
                            title_trace = "Confidence Region")



