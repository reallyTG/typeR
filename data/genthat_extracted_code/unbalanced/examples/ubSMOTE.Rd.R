library(unbalanced)


### Name: ubSMOTE
### Title: SMOTE
### Aliases: ubSMOTE

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubSMOTE(X=input, Y= output)
newData<-cbind(data$X, data$Y)



