library(elasso)


### Name: BRLasso
### Title: Bootstrap ranking LASSO model.
### Aliases: BRLasso

### ** Examples

library(datasets)
head(iris)
X <- as.matrix(subset(iris,iris$Species!="setosa")[,-5])
Y <- as.factor(ifelse(subset(iris,iris$Species!="setosa")[,5]=='versicolor',0,1))
# Fitting a bootstrap ranking LASSO (BRLASSO) logistic regression model
BRLasso.fit <- BRLasso(x=X, y=Y, B=2, Boots=10, kfold=10)
# Variables selected by the BRLASSO model
BRLasso.fit$var.selected
# Coefficients of the selected variables
BRLasso.fit$var.coef



