library(bigKRLS)


### Name: crossvalidate.bigKRLS
### Title: crossvalidate.bigKRLS
### Aliases: crossvalidate.bigKRLS

### ** Examples

# y <- as.matrix(ChickWeight$weight)
# X <- matrix(cbind(ChickWeight$Time, ChickWeight$Diet == 1), ncol = 2)
# cv.out <- crossvalidate.bigKRLS(y, X, seed = 123, ptesting = 20)
# cv.out$pseudoR2_oos # cor(y[test], cv.out$tested$predicted)^2 == 0.7488783
# cv <- summary(cv.out)
# cv$training.ttests                      # hypothesis tests, training model
# kcv.out <- crossvalidate.bigKRLS(y, X, seed = 123, Kfolds = 3)
# kcv <- summary(kcv.out, digits = 3) 
# kcv$overview                   # test stats, in + out of sample, all folds
# kcv$training2.ttests                            # hypothesis tests, fold 2 
# save.bigKRLS(kcv.out, "myKfolds")
# load.bigKRLS("/path/to/myKfolds")     



