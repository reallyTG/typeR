library(SDMTools)


### Name: accuracy
### Title: Measures of Model Accuracy
### Aliases: accuracy

### ** Examples

#create some data
obs = c(sample(c(0,1),20,replace=TRUE),NA); obs = obs[order(obs)]
pred = runif(length(obs),0,1); pred = pred[order(pred)]

#calculate accuracy of the model with a single threshold value
accuracy(obs,pred,threshold=0.5)

#calculate accuracy given several defined thresholds
accuracy(obs,pred,threshold=c(0.33,0.5,0.66))

#calculate accuracy given a number of equal interval thresholds
accuracy(obs,pred,threshold=20)



