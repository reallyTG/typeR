library(klaR)


### Name: woe
### Title: Weights of evidence
### Aliases: woe woe.default woe.formula print.woe
### Keywords: classif multivariate

### ** Examples

## load German credit data
data("GermanCredit")

## training/validation split
train <- sample(nrow(GermanCredit), round(0.6*nrow(GermanCredit)))

woemodel <- woe(credit_risk~., data = GermanCredit[train,], zeroadj=0.5, applyontrain = TRUE)
woemodel

## plot variable information values and woes
plot(woemodel)
plot(woemodel, type = "woes")

## apply woes 
traindata <- predict(woemodel, GermanCredit[train,], replace = TRUE)
str(traindata)

## fit logistic regression model
glmodel     <- glm(credit_risk~., traindata, family=binomial)
summary(glmodel)
pred.trn <- predict(glmodel, traindata, type = "response")

## predict validation data
validata <- predict(woemodel, GermanCredit[-train,], replace = TRUE)
pred.val <- predict(glmodel, validata, type = "response")




