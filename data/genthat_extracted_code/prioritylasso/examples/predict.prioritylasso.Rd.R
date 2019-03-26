library(prioritylasso)


### Name: predict.prioritylasso
### Title: Predictions from prioritylasso
### Aliases: predict.prioritylasso

### ** Examples

pl_bin <- prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rbinom(50,1,0.5),
                       family = "binomial", type.measure = "auc",
                       blocks = list(block1=1:13,block2=14:200, block3=201:500),
                       block1.penalization = TRUE, lambda.type = "lambda.min",
                       standardize = FALSE, nfolds = 5)

newdata_bin <- matrix(rnorm(30*500),30,500)

predict(object = pl_bin, newdata = newdata_bin, type = "response")



