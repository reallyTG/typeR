library(RSDA)


### Name: deter.coefficient
### Title: Compute the determination cosfficient
### Aliases: deter.coefficient
### Keywords: Elastic Lasso Net Ridge Symbolic

### ** Examples

data(int_prost_test)
data(int_prost_train)
res.cm <- sym.lm(lpsa~., sym.data=int_prost_train, method='cm')
pred.cm <- predictsym.lm(res.cm,int_prost_test,method='cm')
deter.coefficient(sym.var(int_prost_test,9),pred.cm$Fitted)

res.cm.lasso <- sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
pred.cm.lasso <- predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
deter.coefficient(sym.var(int_prost_test,9),pred.cm.lasso)



