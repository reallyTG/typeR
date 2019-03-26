library(gglasso)


### Name: cv.gglasso
### Title: Cross-validation for gglasso
### Aliases: cv.gglasso cv.ls cv.logit cv.hsvm cv.sqsvm
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load data set
data(bardet)

# define group index
group <- rep(1:20,each=5)

# 5-fold cross validation using group lasso 
# penalized logisitic regression
cv <- cv.gglasso(x=bardet$x, y=bardet$y, group=group, loss="ls",
pred.loss="L2", lambda.factor=0.05, nfolds=5)



