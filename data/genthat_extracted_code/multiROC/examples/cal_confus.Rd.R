library(multiROC)


### Name: cal_confus
### Title: Calculate confusion matrices
### Aliases: cal_confus
### Keywords: cal_confus

### ** Examples

data(test_data)
true_vec <- test_data[, 1]
pred_vec <- test_data[, 5]
confus_res <- cal_confus(true_vec, pred_vec)



