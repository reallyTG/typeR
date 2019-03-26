library(unbalanced)


### Name: ubOSS
### Title: One Side Selection
### Aliases: ubOSS

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubOSS(X=input, Y= output)
newData<-cbind(data$X, data$Y)



