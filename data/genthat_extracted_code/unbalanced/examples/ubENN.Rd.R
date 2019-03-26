library(unbalanced)


### Name: ubENN
### Title: Edited Nearest Neighbor
### Aliases: ubENN

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubENN(X=input, Y= output)
newData<-cbind(data$X, data$Y)



