library(roccv)


### Name: fit_pred_fold
### Title: Cross validation on fold i
### Aliases: fit_pred_fold

### ** Examples

folds_10 <- randomly_assign(100,10)
x <- matrix(rnorm(800),ncol=8)
y <- runif(100) < exp(1 + x[,1] + x[,5])/(1+exp(1 + x[,1] + x[,5]))
fold_1_results <- fit_pred_fold(1,x,y,folds_10,"glm","binomial")
fold_2_results <- fit_pred_fold(2,x,y,folds_10,"glm","binomial") 



