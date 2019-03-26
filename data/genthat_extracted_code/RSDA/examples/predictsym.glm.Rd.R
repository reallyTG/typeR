library(RSDA)


### Name: predictsym.glm
### Title: Predict method to Lasso, Ridge and and Elastic Net Linear
###   regression model to interval variables
### Aliases: predictsym.glm
### Keywords: Lasso Regression Ridge Symbolic

### ** Examples

data(int_prost_train)
data(int_prost_test)
res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
plot(res.cm.lasso)
plot(res.cm.lasso$glmnet.fit, 'norm', label=TRUE)
plot(res.cm.lasso$glmnet.fit, 'lambda', label=TRUE)
RMSE.L(sym.var(int_prost_test,9),pred.cm.lasso)
RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)
R2.L(sym.var(int_prost_test,9),pred.cm.lasso)
R2.U(sym.var(int_prost_test,9),pred.cm.lasso)
deter.coefficient(sym.var(int_prost_test,9),pred.cm.lasso)




