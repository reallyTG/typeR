library(unbalanced)


### Name: ubBalance
### Title: Balance wrapper
### Aliases: ubBalance

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

#balance the dataset
data<-ubBalance(X= input, Y=output, type="ubSMOTE", percOver=300, percUnder=150, verbose=TRUE)
balancedData<-cbind(data$X,data$Y)



