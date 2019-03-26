library(SDMTools)


### Name: optim.thresh
### Title: Estimation of Optimal Threshold Values
### Aliases: optim.thresh

### ** Examples

#create some data
obs = c(sample(c(0,1),20,replace=TRUE),NA); obs = obs[order(obs)]
pred = runif(length(obs),0,1); pred = pred[order(pred)]

#calculate the optimal thresholds
optim.thresh(obs,pred)



