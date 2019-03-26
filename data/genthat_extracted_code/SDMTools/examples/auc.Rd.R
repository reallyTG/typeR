library(SDMTools)


### Name: auc
### Title: Area Under the Curve of the Reciever Operating Curve
### Aliases: auc

### ** Examples

#create some data
obs = c(sample(c(0,1),20,replace=TRUE),NA)
pred = runif(length(obs),0,1)

#calculate AUC from the random data
auc(obs,pred)

#calculate an example 'perfect' AUC
obs = obs[order(obs)]
pred = pred[order(pred)]
auc(obs,pred)



