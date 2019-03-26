library(DTWUMI)


### Name: DTWUMI_1gap_imputation
### Title: Imputation of a large gap based on DTW for multivariate signals
### Aliases: DTWUMI_1gap_imputation

### ** Examples

data(dataDTWUMI)
dataDTWUMI_gap <- dataDTWUMI[["incomplete_signal"]]
t <- 207 ; T <- 40
imputation <- DTWUMI_1gap_imputation(dataDTWUMI_gap, id_sequence=1, t, T)
plot(dataDTWUMI_gap[, 1], type = "l", lwd = 2)
lines(y = imputation$imputed_values, x = imputation$id_gap, col = "red")
lines(y = dataDTWUMI_gap[imputation$id_query, 1], x = imputation$id_query, col = "green")
lines(y = dataDTWUMI_gap[imputation$id_sim_win, 1], x = imputation$id_sim_win, col = "blue")
lines(y = dataDTWUMI_gap[imputation$id_imputation, 1], x = imputation$id_imputation, col = "orange")



