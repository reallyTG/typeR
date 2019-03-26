library(SDMTools)


### Name: omission
### Title: Measures of Accuracy
### Aliases: omission prop.correct sensitivity specificity

### ** Examples

#create some data
obs = c(sample(c(0,1),20,replace=TRUE),NA); obs = obs[order(obs)]
pred = runif(length(obs),0,1); pred = pred[order(pred)]

#calculate the confusion matrix
mat = confusion.matrix(obs,pred,threshold=0.5)

#calculate the accuracy measures
omission(mat)
sensitivity(mat)
specificity(mat)
prop.correct(mat)



