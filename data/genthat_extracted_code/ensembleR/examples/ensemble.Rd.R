library(ensembleR)


### Name: ensemble
### Title: Perform Ensemble modelling using Caret Package.
### Aliases: ensemble

### ** Examples

data(iris)
preds <- ensemble(iris[1:125,],iris[125:150,],'Species',c('treebag','rpart'),'rpart')
table(preds)




