## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("superml")

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("saraswatmks/superml")

## ------------------------------------------------------------------------
load("../data/reg_train.rda")
# if the above doesn't work, you can try: load("reg_train.rda")

library(data.table)
library(caret)
library(superml)
library(kableExtra)
library(Metrics)

kable(head(reg_train, 10)) %>%
  scroll_box(width = "100%", height = "300px")

split <- createDataPartition(y = reg_train$SalePrice, p = 0.7)
xtrain <- reg_train[split$Resample1]
xtest <- reg_train[!split$Resample1]

## ------------------------------------------------------------------------
# remove features with 90% or more missing values
# we will also remove the Id column because it doesn't contain
# any useful information
na_cols <- colSums(is.na(xtrain)) / nrow(xtrain)
na_cols <- names(na_cols[which(na_cols > 0.9)])

xtrain[, c(na_cols, "Id") := NULL]
xtest[, c(na_cols, "Id") := NULL]

# encode categorical variables
cat_cols <- names(xtrain)[sapply(xtrain, is.character)]

for(c in cat_cols){
    lbl <- LabelEncoder$new()
    lbl$fit(c(xtrain[[c]], xtest[[c]]))
    xtrain[[c]] <- lbl$transform(xtrain[[c]])
    xtest[[c]] <- lbl$transform(xtest[[c]])
}

# removing noise column
noise <- c('GrLivArea','TotalBsmtSF')

xtrain[, c(noise) := NULL]
xtest[, c(noise) := NULL]

# fill missing value with  -1
xtrain[is.na(xtrain)] <- -1
xtest[is.na(xtest)] <- -1

## ------------------------------------------------------------------------
knn <- KNNTrainer$new(k = 2,prob = T,type = 'reg')
knn$fit(train = xtrain, test = xtest, y = 'SalePrice')
probs <- knn$predict(type = 'prob')
labels <- knn$predict(type='raw')
rmse(actual = xtest$SalePrice, predicted=labels)

## ------------------------------------------------------------------------
#predicts probabilities - must specify mc_type ("OvA_hinge", "AvA_hinge")
svm <- SVMTrainer$new(type="ls")
svm$fit(xtrain, 'SalePrice')
pred <- svm$predict(xtest)
rmse(actual = xtest$SalePrice, predicted = pred)

## ------------------------------------------------------------------------
lf <- LMTrainer$new(family="gaussian")
lf$fit(X = xtrain, y = "SalePrice")
summary(lf$model)
predictions <- lf$predict(df = xtest)
rmse(actual = xtest$SalePrice, predicted = predictions)

## ------------------------------------------------------------------------
lf <- LMTrainer$new(family = "gaussian", alpha=1, lambda = 1000)
lf$fit(X = xtrain, y = "SalePrice")
predictions <- lf$predict(df = xtest)
rmse(actual = xtest$SalePrice, predicted = predictions)

## ------------------------------------------------------------------------
lf <- LMTrainer$new(family = "gaussian", alpha=0)
lf$fit(X = xtrain, y = "SalePrice")
predictions <- lf$predict(df = xtest)
rmse(actual = xtest$SalePrice, predicted = predictions)

## ------------------------------------------------------------------------
lf <- LMTrainer$new(family = "gaussian")
lf$cv_model(X = xtrain, y = 'SalePrice', nfolds = 5, parallel = FALSE)
predictions <- lf$cv_predict(df = xtest)
coefs <- lf$get_importance()
rmse(actual = xtest$SalePrice, predicted = predictions)

## ------------------------------------------------------------------------
rf <- RFTrainer$new(n_estimators = 500,classification = 0)
rf$fit(X = xtrain, y = "SalePrice")
pred <- rf$predict(df = xtest)
rf$get_importance()
rmse(actual = xtest$SalePrice, predicted = pred)

## ------------------------------------------------------------------------
xgb <- XGBTrainer$new(objective = "reg:linear"
                      , n_estimators = 500
                      , eval_metric = "rmse"
                      , maximize = F
                      , learning_rate = 0.1
                      ,max_depth = 6)
xgb$fit(X = xtrain, y = "SalePrice", valid = xtest)
pred <- xgb$predict(xtest)
rmse(actual = xtest$SalePrice, predicted = pred)

## ------------------------------------------------------------------------
xgb <- XGBTrainer$new(objective="reg:linear")

gst <-GridSearchCV$new(trainer = xgb,
                             parameters = list(n_estimators = c(10,50), max_depth = c(5,2)),
                             n_folds = 3,
                             scoring = c('accuracy','auc'))
gst$fit(xtrain, "SalePrice")
gst$best_iteration()

## ------------------------------------------------------------------------
rf <- RFTrainer$new()
rst <-RandomSearchCV$new(trainer = rf,
                             parameters = list(n_estimators = c(10,50),
                             max_depth = c(5,2)),
                             n_folds = 3,
                             scoring = c('accuracy','auc'),
                             n_iter=3)
rst$fit(xtrain, "SalePrice")
rst$best_iteration()

## ------------------------------------------------------------------------
# load class
load('../data/cla_train.rda')
# if the above doesn't work, you can try: load("cla_train.rda")

kable(head(cla_train, 10)) %>%
  scroll_box(width = "100%", height = "300px")

# split the data
split <- createDataPartition(y = cla_train$Survived,p = 0.7)
xtrain <- cla_train[split$Resample1]
xtest <- cla_train[!split$Resample1]

# encode categorical variables - shorter way
for(c in c('Embarked','Sex','Cabin')){
    lbl <- LabelEncoder$new()
    lbl$fit(c(xtrain[[c]], xtest[[c]]))
    xtrain[[c]] <- lbl$transform(xtrain[[c]])
    xtest[[c]] <- lbl$transform(xtest[[c]])
}

# impute missing values
xtrain[, Age := replace(Age, is.na(Age), median(Age, na.rm = T))]
xtest[, Age := replace(Age, is.na(Age), median(Age, na.rm = T))]

# drop these features
to_drop <- c('PassengerId','Ticket','Name')

xtrain <- xtrain[,-c(to_drop), with=F]
xtest <- xtest[,-c(to_drop), with=F]

## ------------------------------------------------------------------------
knn <- KNNTrainer$new(k = 2,prob = T,type = 'class')
knn$fit(train = xtrain, test = xtest, y = 'Survived')
probs <- knn$predict(type = 'prob')
labels <- knn$predict(type='raw')
auc(actual = xtest$Survived, predicted=labels)

## ------------------------------------------------------------------------
nb <- NBTrainer$new()
nb$fit(xtrain, 'Survived')
pred <- nb$predict(xtest)
auc(actual = xtest$Survived, predicted=pred)

## ------------------------------------------------------------------------
#predicts probabilities - must specify mc_type ("OvA_hinge", "AvA_hinge")
svm <- SVMTrainer$new(predict.prob = T, type="bc", mc_type="OvA_hinge")
svm$fit(xtrain, 'Survived')
pred <- svm$predict(xtest)
auc(actual = xtest$Survived, predicted=pred[,2])

#predicts labels
svm <- SVMTrainer$new(predict.prob = F, type="bc")
svm$fit(xtrain, 'Survived')
pred <- svm$predict(xtest)
auc(actual = xtest$Survived, predicted=pred)

## ------------------------------------------------------------------------
lf <- LMTrainer$new(family="binomial")
lf$fit(X = xtrain, y = "Survived")
summary(lf$model)
predictions <- lf$predict(df = xtest)
auc(actual = xtest$Survived, predicted = predictions)


## ------------------------------------------------------------------------
lf <- LMTrainer$new(family="binomial", alpha=1)
lf$cv_model(X = xtrain, y = "Survived", nfolds = 5, parallel = FALSE)
pred <- lf$cv_predict(df = xtest)
auc(actual = xtest$Survived, predicted = pred)


## ------------------------------------------------------------------------
lf <- LMTrainer$new(family="binomial", alpha=0)
lf$cv_model(X = xtrain, y = "Survived", nfolds = 5, parallel = FALSE)
pred <- lf$cv_predict(df = xtest)
auc(actual = xtest$Survived, predicted = pred)

## ------------------------------------------------------------------------
rf <- RFTrainer$new(n_estimators = 500,classification = 1, max_features = 3)
rf$fit(X = xtrain, y = "Survived")

pred <- rf$predict(df = xtest)
rf$get_importance()

auc(actual = xtest$Survived, predicted = pred)

## ------------------------------------------------------------------------
xgb <- XGBTrainer$new(objective = "binary:logistic"
                      , n_estimators = 500
                      , eval_metric = "auc"
                      , maximize = T
                      , learning_rate = 0.1
                      ,max_depth = 6)
xgb$fit(X = xtrain, y = "Survived", valid = xtest)

pred <- xgb$predict(xtest)
auc(actual = xtest$Survived, predicted = pred)

## ------------------------------------------------------------------------
xgb <- XGBTrainer$new(objective="binary:logistic")
gst <-GridSearchCV$new(trainer = xgb,
                             parameters = list(n_estimators = c(10,50),
                             max_depth = c(5,2)),
                             n_folds = 3,
                             scoring = c('accuracy','auc'))
gst$fit(xtrain, "Survived")
gst$best_iteration()

## ------------------------------------------------------------------------
rf <- RFTrainer$new()
rst <-RandomSearchCV$new(trainer = rf,
                             parameters = list(n_estimators = c(10,50),
                             max_depth = c(5,2)),
                             n_folds = 3,
                             scoring = c('accuracy','auc'),
                             n_iter = 3)
rst$fit(xtrain, "Survived")
rst$best_iteration()

## ------------------------------------------------------------------------
# add target encoding features
xtrain[, feat_01 := smoothMean(train_df = xtrain,
                        test_df = xtest,
                        colname = "Embarked",
                        target = "Survived")$train[[2]]]
xtest[, feat_01 := smoothMean(train_df = xtrain,
                               test_df = xtest,
                               colname = "Embarked",
                               target = "Survived")$test[[2]]]

# train a random forest
# Random Forest
rf <- RFTrainer$new(n_estimators = 500,classification = 1, max_features = 4)
rf$fit(X = xtrain, y = "Survived")
pred <- rf$predict(df = xtest)
rf$get_importance()

auc(actual = xtest$Survived, predicted = pred)

