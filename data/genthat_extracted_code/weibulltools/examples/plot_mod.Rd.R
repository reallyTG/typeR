library(weibulltools)


### Name: plot_mod
### Title: Adding an Estimated Population Line to a Probability Plot
### Aliases: plot_mod

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
id <- LETTERS[1:length(obs)]

df_john <- johnson_method(x = obs, event = state, id = id)
mrr <- rank_regression(x = df_john$characteristic,
                       y = df_john$prob,
                       event = df_john$status,
                       distribution = "weibull",
                       conf_level = .90)

plot_weibull <- plot_prob(x = df_john$characteristic,
                          y = df_john$prob,
                          event = df_john$status,
                          id = df_john$id,
                          distribution = "weibull",
                          title_main = "Weibull Analysis",
                          title_x = "Mileage in miles",
                          title_y = "Probability of Failure in %",
                          title_trace = "Failed Items")

plot_reg_weibull <- plot_mod(p_obj = plot_weibull, x = obs,
                             loc_sc_params = mrr$loc_sc_coefficients,
                             distribution = "weibull",
                             title_trace = "Estimated Weibull CDF")



