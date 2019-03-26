library(corkscrew)


### Name: apply.tbin
### Title: Extrapolate t-test based binning to a new data
### Aliases: apply.tbin
### Keywords: ~misc

### ** Examples

train = as.data.frame(cbind(runif(1000, 10, 1000),sample(1:40, 1000,TRUE)))
colnames(train) = c("response","state")
train$state = as.factor(train$state)
train.output = tbin(dv = "response",idv = c("state"),train,25,TRUE)

# extrapolating the tbin function to a new dataset using apply.tbin
test = as.data.frame(sample(1:40, 100,TRUE))
colnames(test) = c("state")
test$state = as.factor(test$state)
test.output = apply.tbin(idv = c("state"), train.output, test)



