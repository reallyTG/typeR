library(unbalanced)


### Name: ubCNN
### Title: Condensed Nearest Neighbor
### Aliases: ubCNN

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubCNN(X=input, Y= output)
newData<-cbind(data$X, data$Y)




