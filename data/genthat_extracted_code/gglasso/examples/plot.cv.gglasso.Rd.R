library(gglasso)


### Name: plot.cv.gglasso
### Title: plot the cross-validation curve produced by cv.gglasso
### Aliases: plot.cv.gglasso
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

# make a CV plot
plot(cv)



