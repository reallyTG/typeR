library(ROSE)


### Name: roc.curve
### Title: ROC curve
### Aliases: roc.curve
### Keywords: supervised classification

### ** Examples

# 2-dimensional example
# loading data
data(hacide)

# check imbalance on training set
table(hacide.train$cls)

# model estimation using logistic regression
fit.hacide  <- glm(cls~., data=hacide.train, family="binomial")

# prediction on training set
pred.hacide.train <- predict(fit.hacide, newdata=hacide.train)

# plot the ROC curve (training set)
roc.curve(hacide.train$cls, pred.hacide.train, 
          main="ROC curve \n (Half circle depleted data)")

# check imbalance on test set 
table(hacide.test$cls)

# prediction using test set
pred.hacide.test <- predict(fit.hacide, newdata=hacide.test)

# add the ROC curve (test set)
roc.curve(hacide.test$cls, pred.hacide.test, add=TRUE, col=2, 
          lwd=2, lty=2)
legend("topleft", c("Resubstitution estimate", "Holdout estimate"), 
        col=1:2, lty=1:2, lwd=2)



