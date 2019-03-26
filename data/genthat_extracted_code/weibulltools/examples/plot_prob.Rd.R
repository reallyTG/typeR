library(weibulltools)


### Name: plot_prob
### Title: Probability Plotting Method for Univariate Lifetime
###   Distributions
### Aliases: plot_prob

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
id <- LETTERS[1:length(obs)]

df_john <- johnson_method(x = obs, event = state, id = id)

plot_weibull <- plot_prob(x = df_john$characteristic,
                          y = df_john$prob,
                          event = df_john$status,
                          id = df_john$id,
                          distribution = "weibull",
                          title_main = "Weibull Analysis",
                          title_x = "Mileage in miles",
                          title_y = "Probability of Failure in %",
                          title_trace = "Failed Items")



