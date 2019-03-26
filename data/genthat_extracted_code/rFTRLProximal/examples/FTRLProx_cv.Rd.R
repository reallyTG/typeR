library(rFTRLProximal)


### Name: FTRLProx_cv
### Title: FTRL-Proximal Linear Model Cross Validation
### Aliases: FTRLProx_cv

### ** Examples

library(FeatureHashing)
library(data.table)
library(rBayesianOptimization)
library(MLmetrics)
data(ipinyou)
m.train <- FTRLProx_Hashing(~ 0 + ., ipinyou.train[,-"IsClick", with = FALSE],
                            hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
ftrl_model_cv <- FTRLProx_cv(x = m.train, y = as.numeric(ipinyou.train$IsClick),
                             family = "binomial",
                             params = list(alpha = 0.01, beta = 0.1, l1 = 1.0, l2 = 1.0),
                             epoch = 10,
                             folds = KFold(as.numeric(ipinyou.train$IsClick), nfolds = 5),
                             eval = AUC)



