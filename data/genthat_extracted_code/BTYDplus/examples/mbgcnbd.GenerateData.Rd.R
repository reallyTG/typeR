library(BTYDplus)


### Name: mbgcnbd.GenerateData
### Title: Simulate data according to (M)BG/CNBD-k model assumptions
### Aliases: bgcnbd.GenerateData mbgcnbd.GenerateData

### ** Examples

params <- c(k = 3, r = 0.85, alpha = 1.45, a = 0.79, b = 2.42)
data <- mbgcnbd.GenerateData(n = 1000, T.cal = 24, T.star = 32, params)

# customer by sufficient summary statistic - one row per customer
head(data$cbs)

# event log - one row per event/transaction
head(data$elog)



