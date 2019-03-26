library(unbalanced)


### Name: ubOver
### Title: Over-sampling
### Aliases: ubOver

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubOver(X=input, Y= output)
newData<-cbind(data$X, data$Y)



