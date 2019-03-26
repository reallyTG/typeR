library(sGMRFmix)


### Name: sGMRFmix
### Title: Sparse Gaussian Markov Random Field Mixtures
### Aliases: sGMRFmix

### ** Examples

library(sGMRFmix)

set.seed(314)
train_data <- generate_train_data()
fit <- sGMRFmix(train_data, K = 7, rho = 10)
fit




