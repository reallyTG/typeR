library(rFTRLProximal)


### Name: FTRLProx_validate
### Title: FTRL-Proximal Linear Model Validation
### Aliases: FTRLProx_validate

### ** Examples

library(data.table)
library(FeatureHashing)
library(MLmetrics)
data(ipinyou)
m.train <- FTRLProx_Hashing(~ 0 + ., ipinyou.train[, -"IsClick", with = FALSE],
                            hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
m.test <- FTRLProx_Hashing(~ 0 + ., ipinyou.test[,-"IsClick", with = FALSE],
                           hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
ftrl_model_val <- FTRLProx_validate(x = m.train, y = as.numeric(ipinyou.train$IsClick),
                                    family = "binomial",
                                    params = list(alpha = 0.01, beta = 0.1, l1 = 1.0, l2 = 1.0),
                                    epoch = 20,
                                    val_x = m.test,
                                    val_y = as.numeric(ipinyou.test$IsClick),
                                    eval = AUC, verbose = TRUE)



