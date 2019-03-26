library(RSDA)


### Name: predictsym.lm
### Title: Predict method to CM and CRM Linear regression model
### Aliases: predictsym.lm
### Keywords: Symbolic lm

### ** Examples

data(int_prost_train)
data(int_prost_test)
res.cm <- sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
pred.cm <- predictsym.lm(res.cm,int_prost_test,method='cm')




