library(BTYDplus)


### Name: abe.GenerateData
### Title: Simulate data according to Pareto/NBD (Abe) model assumptions
### Aliases: abe.GenerateData

### ** Examples

# generate artificial Pareto/NBD (Abe) with 2 covariates
params <- list()
params$beta  <- matrix(c(0.18, -2.5, 0.5, -0.3, -0.2, 0.8), byrow = TRUE, ncol = 2)
params$gamma <- matrix(c(0.05, 0.1, 0.1, 0.2), ncol = 2)
data <- abe.GenerateData(n = 2000, T.cal = 32, T.star = 32, params)
cbs <- data$cbs  # customer by sufficient summary statistic - one row per customer
elog <- data$elog  # Event log - one row per event/purchase



