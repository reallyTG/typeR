library(multiROC)


### Name: cal_auc
### Title: Area under ROC curve
### Aliases: cal_auc
### Keywords: cal_auc

### ** Examples

data(test_data)
true_vec <- test_data[, 1]
pred_vec <- test_data[, 5]
confus_res <- cal_confus(true_vec, pred_vec)
AUC_res <- cal_auc(confus_res$TPR, confus_res$FPR)



