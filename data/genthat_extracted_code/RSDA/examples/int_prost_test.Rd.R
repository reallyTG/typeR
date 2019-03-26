library(RSDA)


### Name: int_prost_test
### Title: Linear regression model data example.
### Aliases: int_prost_test
### Keywords: datasets

### ** Examples

data(int_prost_train)
data(int_prost_test)
res.cm<-sym.lm(lpsa~.,sym.data=int_prost_test,method='cm')
res.cm<-sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
pred.cm<-predictsym.lm(res.cm,int_prost_test,method='cm')
RMSE.L(sym.var(int_prost_test,9),pred.cm$Fitted)
RMSE.U(sym.var(int_prost_test,9),pred.cm$Fitted)
R2.L(sym.var(int_prost_test,9),pred.cm$Fitted)
R2.U(sym.var(int_prost_test,9),pred.cm$Fitted)
deter.coefficient(sym.var(int_prost_test,9),pred.cm$Fitted)

res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
plot(res.cm.lasso)
plot(res.cm.lasso$glmnet.fit, 'norm', label=TRUE)
plot(res.cm.lasso$glmnet.fit, 'lambda', label=TRUE)
pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
RMSE.L(sym.var(int_prost_test,9),pred.cm.lasso)
RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)
R2.L(sym.var(int_prost_test,9),pred.cm.lasso)
R2.U(sym.var(int_prost_test,9),pred.cm.lasso)
deter.coefficient(sym.var(int_prost_test,9),pred.cm.lasso)



