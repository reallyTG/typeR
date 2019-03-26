library(BTYDplus)


### Name: pnbd.GenerateData
### Title: Simulate data according to Pareto/NBD model assumptions
### Aliases: pnbd.GenerateData

### ** Examples

params <- list(r = 5, alpha = 10, s = 0.8, beta = 12)
data <- pnbd.GenerateData(n = 1000, T.cal = 32, T.star = 32, params)
cbs <- data$cbs  # customer by sufficient summary statistic - one row per customer
elog <- data$elog  # Event log - one row per event/purchase



