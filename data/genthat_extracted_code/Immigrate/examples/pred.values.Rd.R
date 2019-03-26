library(Immigrate)


### Name: pred.values
### Title: pred.values
### Aliases: pred.values
### Keywords: predict, values

### ** Examples

y_train<-c(0,1,0,1,0,1)
y_test<-c(0,1,0,1)
pred_train<-c(0.77,0.89,0.32,0.96,0.10,0.67)
pred_test<-c(0.68,0.75,0.50,0.81)
re<-pred.values(y_train,y_test,pred_train,pred_test)
print(re)




