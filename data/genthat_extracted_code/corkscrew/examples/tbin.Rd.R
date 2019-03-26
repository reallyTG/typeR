library(corkscrew)


### Name: tbin
### Title: t-test based binning
### Aliases: tbin
### Keywords: ~misc

### ** Examples

train = as.data.frame(cbind(runif(1000, 10, 1000),sample(1:40, 1000,TRUE)))
colnames(train) = c("response","state")
train$state = as.factor(train$state)
train.output = tbin(dv = "response",idv = c("state"),train,25,TRUE)



