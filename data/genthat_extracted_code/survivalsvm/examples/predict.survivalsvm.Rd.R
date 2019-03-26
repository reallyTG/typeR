library(survivalsvm)


### Name: predict.survivalsvm
### Title: Suvirvalsvm predictions
### Aliases: predict.survivalsvm

### ** Examples

require(survival)
set.seed(123)
n <- nrow(veteran)
train.index <- sample(1:n, 0.7*n, replace = FALSE)
test.index <- setdiff(1:n, train.index)
survsvm.reg <- survivalsvm(Surv(veteran$diagtime, veteran$status) ~ .,
                           subset = train.index, data = veteran,
                           type = "regression", gamma.mu = 1,
                           opt.meth = "quadprog", kernel = "add_kernel")
pred.survsvm.reg <- predict(object = survsvm.reg, newdata = veteran, subset = test.index)
print(pred.survsvm.reg)



