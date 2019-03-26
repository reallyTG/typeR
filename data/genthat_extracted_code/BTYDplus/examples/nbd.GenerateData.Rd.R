library(BTYDplus)


### Name: nbd.GenerateData
### Title: Simulate data according to NBD model assumptions
### Aliases: nbd.GenerateData

### ** Examples

n <- 1000  # no. of customers
T.cal <- 32  # length of calibration period
T.star <- 32  # length of hold-out period
params <- c(r = 0.85, alpha = 4.45)  # purchase frequency lambda_i ~ Gamma(r, alpha)
data <- nbd.GenerateData(n, T.cal, T.star, params)
cbs <- data$cbs  # customer by sufficient summary statistic - one row per customer
elog <- data$elog  # Event log - one row per event/purchase



