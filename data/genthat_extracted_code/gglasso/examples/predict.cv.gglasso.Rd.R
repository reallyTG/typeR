library(gglasso)


### Name: predict.cv.gglasso
### Title: make predictions from a "cv.gglasso" object.
### Aliases: predict.cv.gglasso
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load data set
data(colon)

# define group index
group <- rep(1:20,each=5)

# 5-fold cross validation using group lasso 
# penalized logisitic regression
cv <- cv.gglasso(x=colon$x, y=colon$y, group=group, loss="logit",
pred.loss="misclass", lambda.factor=0.05, nfolds=5)

# the coefficients at lambda = lambda.min, newx = x[1,]
pre = predict(cv$gglasso.fit, newx = colon$x[1:10,], 
s = cv$lambda.min, type = "class")



