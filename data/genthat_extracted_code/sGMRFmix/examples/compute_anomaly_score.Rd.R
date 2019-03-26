library(sGMRFmix)


### Name: compute_anomaly_score
### Title: Compute anomaly scores
### Aliases: compute_anomaly_score

### ** Examples

library(sGMRFmix)

set.seed(314)
train_data <- generate_train_data()
fit <- sGMRFmix(train_data, K = 7, rho = 10)

test_data <- generate_test_data()
compute_anomaly_score(fit, test_data)




