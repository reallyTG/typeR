library(unbalanced)


### Name: ubTomek
### Title: Tomek Link
### Aliases: ubTomek

### ** Examples

library(unbalanced)
data(ubIonosphere)
n<-ncol(ubIonosphere)
output<-ubIonosphere$Class
input<-ubIonosphere[ ,-n]

data<-ubTomek(X=input, Y= output)
newData<-cbind(data$X, data$Y)



