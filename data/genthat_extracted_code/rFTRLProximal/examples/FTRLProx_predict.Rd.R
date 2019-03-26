library(rFTRLProximal)


### Name: FTRLProx_predict
### Title: FTRL-Proximal Linear Model Predicting
### Aliases: FTRLProx_predict

### ** Examples

library(data.table)
library(FeatureHashing)
library(MLmetrics)
data(ipinyou)
m.train <- FTRLProx_Hashing(~ 0 + ., ipinyou.train[, -"IsClick", with = FALSE],
                            hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
m.test <- FTRLProx_Hashing(~ 0 + ., ipinyou.test[,-"IsClick", with = FALSE],
                           hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
ftrl_model <- FTRLProx_train(m.train, y = as.numeric(ipinyou.train$IsClick), family = "binomial",
                             params = list(alpha = 0.01, beta = 0.1, l1 = 1.0, l2 = 1.0),
                             epoch = 10, verbose = TRUE)
pred_ftrl <- FTRLProx_predict(ftrl_model, newx = m.test)
AUC(pred_ftrl, as.numeric(ipinyou.test$IsClick))



