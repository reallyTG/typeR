library(BTYDplus)


### Name: pggg.GenerateData
### Title: Simulate data according to Pareto/GGG model assumptions
### Aliases: pggg.GenerateData

### ** Examples

params <- list(t = 4.5, gamma = 1.5, r = 5, alpha = 10, s = 0.8, beta = 12)
data <- pggg.GenerateData(n = 1000, T.cal = 32, T.star = 32, params)
cbs <- data$cbs  # customer by sufficient summary statistic - one row per customer
elog <- data$elog  # Event log - one row per event/purchase



