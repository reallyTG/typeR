library(dblr)


### Name: dblr_train
### Title: Discrete Boosting Logistic Regression Training
### Aliases: dblr_train

### ** Examples

# use iris data for example
dat <- iris
# create two categorical variables
dat$Petal.Width <- as.factor((iris$Petal.Width<=0.2)*1+(iris$Petal.Width>1.0)*2)
dat$Sepal.Length <- (iris$Sepal.Length<=3.0)*2+(iris$Sepal.Length>6.0)*1.25
# create the response variable
dat$Species <- as.numeric(dat$Species=='versicolor')
set.seed(123)
# random sampling
index <- sample(1:150,100,replace = FALSE)
# train the dblr model using the training data
dblr_fit <- dblr_train(train_x=dat[index,c(1:4)],
train_y=dat[index,5],category_cols = c('Petal.Width','Sepal.Length'),
metric = 'logloss',subsample = 0.5,eta = 0.05,colsample = 1.0,
lambda = 1.0,cv_early_stops = 10,verbose=FALSE)
# make predictions on testing data
pred_dblr <- predict(dblr_fit,newdata = dat[-index,],type = 'response')
dblr_auc <- Metrics::auc(actual = dat[-index,'Species'],predicted = pred_dblr)
dblr_logloss <- Metrics::logLoss(actual = dat[-index,'Species'],predicted = pred_dblr)
cat('test auc for dblr model:',dblr_auc,'\n')
cat('test logloss for dblr model:',dblr_logloss,'\n')
glm_fit <- glm(data=dat[index,],formula =Species~. ,family = binomial)
pred_glm <- predict(glm_fit,newdata = dat[-index,],type='response')
glm_auc <- Metrics::auc(actual = dat[-index,'Species'],predicted = pred_glm)
glm_logloss <- Metrics::logLoss(actual = dat[-index,'Species'],predicted = pred_glm)
cat('test auc for glm model:',glm_auc,'\n')
cat('test logloss for glm model:',glm_logloss,'\n')



