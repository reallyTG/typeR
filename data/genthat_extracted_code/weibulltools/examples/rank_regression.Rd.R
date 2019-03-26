library(weibulltools)


### Name: rank_regression
### Title: Rank Regression for Two-Parameter Lifetime Distributions
### Aliases: rank_regression

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)

df_john <- johnson_method(x = obs, event = state)
mrr <- rank_regression(x = df_john$characteristic,
                       y = df_john$prob,
                       event = df_john$status,
                       distribution = "weibull",
                       conf_level = .90)



