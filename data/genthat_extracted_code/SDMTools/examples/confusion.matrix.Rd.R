library(SDMTools)


### Name: confusion.matrix
### Title: Confusion Matrix
### Aliases: confusion.matrix

### ** Examples

#create some data
obs = c(sample(c(0,1),20,replace=TRUE),NA); obs = obs[order(obs)]
pred = runif(length(obs),0,1); pred = pred[order(pred)]

#calculate the confusion matrix
confusion.matrix(obs,pred,threshold=0.5)



