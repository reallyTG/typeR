library(ROSE)


### Name: ROSE-package
### Title: ROSE: Random Over-Sampling Examples
### Aliases: ROSE-package ROSEpack
### Keywords: package machine learning imbalanced data

### ** Examples

# loading data
data(hacide)

# check imbalance
table(hacide.train$cls)

# train logistic regression on imbalanced data
log.reg.imb <- glm(cls ~ ., data=hacide.train, family=binomial)

# use the trained model to predict test data
pred.log.reg.imb <- predict(log.reg.imb, newdata=hacide.test,
                            type="response")

# generate new balanced data by ROSE
hacide.rose <- ROSE(cls ~ ., data=hacide.train, seed=123)$data

# check (im)balance of new data
table(hacide.rose$cls)

# train logistic regression on balanced data
log.reg.bal <- glm(cls ~ ., data=hacide.rose, family=binomial)

# use the trained model to predict test data
pred.log.reg.bal <- predict(log.reg.bal, newdata=hacide.test,
                            type="response")

# check accuracy of the two learners by measuring auc
roc.curve(hacide.test$cls, pred.log.reg.imb)
roc.curve(hacide.test$cls, pred.log.reg.bal, add.roc=TRUE, col=2)

# determine bootstrap distribution of the AUC of logit models
# trained on ROSE balanced samples
# B has been reduced from 100 to 10 for time saving solely
boot.auc.bal <- ROSE.eval(cls ~ ., data=hacide.train, learner= glm, 
                          method.assess = "BOOT", 
                          control.learner=list(family=binomial), 
                          trace=TRUE, B=10)

summary(boot.auc.bal)



