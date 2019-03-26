library(DTWUMI)


### Name: DTWUMI-package
### Title: Imputation of Multivariate Time Series Based on Dynamic Time
###   Warping
### Aliases: DTWUMI-package DTWUMI
### Keywords: package DTW times series imputation

### ** Examples

data(dataDTWUMI)
dataDTWUMI_gap <- dataDTWUMI[["incomplete_signal"]]
imputation <- DTWUMI_imputation(dataDTWUMI_gap, gap_size_threshold = 10, DTW_method = "DTW")
plot(dataDTWUMI_gap[, 1], type = "l", lwd = 2)
lines(imputation$output[, 1], col = "red")
plot(dataDTWUMI_gap[, 2], type = "l", lwd = 2)
lines(imputation$output[, 2], col = "red")
plot(dataDTWUMI_gap[, 3], type = "l", lwd = 2)
lines(imputation$output[, 3], col = "red")



