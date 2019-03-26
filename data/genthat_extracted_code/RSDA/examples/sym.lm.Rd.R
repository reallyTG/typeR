library(RSDA)


### Name: sym.lm
### Title: CM and CRM Linear regression model.
### Aliases: sym.lm
### Keywords: Symbolic lm

### ** Examples

data(int_prost_train)
data(int_prost_test)
res.cm<-sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
pred.cm<-predictsym.lm(res.cm,int_prost_test,method='cm')
RMSE.L(sym.var(int_prost_test,9),pred.cm$Fitted)
RMSE.U(sym.var(int_prost_test,9),pred.cm$Fitted)
R2.L(sym.var(int_prost_test,9),pred.cm$Fitted)
R2.U(sym.var(int_prost_test,9),pred.cm$Fitted)
deter.coefficient(sym.var(int_prost_test,9),pred.cm$Fitted)



