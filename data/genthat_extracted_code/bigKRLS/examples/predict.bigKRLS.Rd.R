library(bigKRLS)


### Name: predict.bigKRLS
### Title: predict.bigKRLS
### Aliases: predict.bigKRLS

### ** Examples

 
# y <- as.matrix(ChickWeight$weight)
# X <- matrix(cbind(ChickWeight$Time, ChickWeight$Diet == 1), ncol = 2)
# N <- length(y)
# set.seed(123)
# train <- sample(N, 100, replace = FALSE)
# outOfSample <- c(1:N)[-train]
# test <- sample(outOfSample, 10, replace = FALSE)
# fit <- bigKRLS(y[train], X[train,], instructions = FALSE) 
# p <- predict(fit, X[test,])
# range(p$predicted) # 44.04614 257.76520



