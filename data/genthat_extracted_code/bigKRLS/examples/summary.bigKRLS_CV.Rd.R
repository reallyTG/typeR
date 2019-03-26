library(bigKRLS)


### Name: summary.bigKRLS_CV
### Title: summary.bigKRLS_CV
### Aliases: summary.bigKRLS_CV

### ** Examples

# y <- as.matrix(ChickWeight$weight)
# X <- matrix(cbind(ChickWeight$Time, ChickWeight$Diet == 1), ncol = 2)
# cv.out <- crossvalidate.bigKRLS(y, X, seed = 123, ptesting = 20)
# summary(cv.out)
# cv <- summary(cv.out, labs = c("Alpha", "Beta", "Gamma", "Delta", "Epsilon"))
# cv$training.ttests            # hypothesis tests, training model
# kcv.out <- crossvalidate.bigKRLS(y, X, seed = 123, Kfolds = 3)
# summary(kcv.out)           
# kcv <- summary(kcv.out) 
# kcv$overview                 # test stats, in + out of sample, all folds
# kcv$training2.ttests         # hypothesis tests, fold 2 



