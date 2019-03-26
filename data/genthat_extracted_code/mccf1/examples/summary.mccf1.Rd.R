library(mccf1)


### Name: summary.mccf1
### Title: Summarize the the performance of a binary classification using
###   MCC-F1 metric and the best threshold
### Aliases: summary.mccf1

### ** Examples

response <- c(rep(1, 1000), rep(0, 10000))
set.seed(2017)
predictor <- c(rbeta(300, 12, 2), rbeta(700, 3, 4), rbeta(10000, 2, 3))
## Not run: summary(mccf1(response, predictor))
# mccf1_metric best_threshold
#    0.3508904       0.786905
summary(mccf1(response, predictor), bins = 50)
# mccf1_metric best_threshold
#    0.3432971       0.786905
## Not run: summary(mccf1(response, predictor), digits = 3)
# mccf1_metric best_threshold
#    0.351          0.787



