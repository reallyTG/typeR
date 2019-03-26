library(mccf1)


### Name: mccf1
### Title: MCC (Matthews correlation coefficient) - F1
### Aliases: mccf1

### ** Examples

response <- c(rep(1, 1000), rep(0, 10000))
set.seed(2017)
predictor <- c(rbeta(300, 12, 2), rbeta(700, 3, 4), rbeta(10000, 2, 3))
x <- mccf1(response, predictor)
head(x$normalizedMCC)
# [1]  NaN 0.5150763 0.5213220 0.5261152 0.5301566 0.5337177
head(x$F1)
# [1]  NaN 0.001998002 0.003992016 0.005982054 0.007968127 0.009950249
head(x$thresholds)
# [1]  Inf 0.9935354 0.9931493 0.9930786 0.9925507 0.9900520



