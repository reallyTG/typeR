library(RSDA)


### Name: RMSE.U
### Title: Upper boundary root-mean-square error
### Aliases: RMSE.U
### Keywords: root-mean-square upper

### ** Examples

data(int_prost_train)
data(int_prost_test)
res.cm<-sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
pred.cm<-predictsym.lm(res.cm,int_prost_test,method='cm')
RMSE.U(sym.var(int_prost_test,9),pred.cm$Fitted)

res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)



