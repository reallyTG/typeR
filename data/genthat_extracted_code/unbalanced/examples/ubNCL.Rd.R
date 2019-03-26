library(unbalanced)


### Name: ubNCL
### Title: Neighborhood Cleaning Rule
### Aliases: ubNCL

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubNCL(X=input, Y= output)
newData<-cbind(data$X, data$Y)



