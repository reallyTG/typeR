library(ROSE)


### Name: accuracy.meas
### Title: Metrics to evaluate a classifier accuracy in imbalanced learning
### Aliases: accuracy.meas
### Keywords: supervised classification

### ** Examples

# 2-dimensional example
# loading data
data(hacide)

# imbalance on training set
table(hacide.train$cls)

# model estimation using logistic regression
fit.hacide  <- glm(cls~., data=hacide.train, family="binomial")

# prediction on training set
pred.hacide.train <- predict(fit.hacide, newdata=hacide.train,
                             type="response")

# compute accuracy measures (training set)
accuracy.meas(hacide.train$cls, pred.hacide.train, threshold = 0.02)

# imbalance on test set 
table(hacide.test$cls)

# prediction on test set
pred.hacide.test <- predict(fit.hacide, newdata=hacide.test,
                            type="response")

# compute accuracy measures (test set)
accuracy.meas(hacide.test$cls, pred.hacide.test, threshold = 0.02)




