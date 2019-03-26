library(klaR)


### Name: pvs
### Title: Pairwise variable selection for classification
### Aliases: pvs pvs.default pvs.formula print.pvs
### Keywords: classif multivariate

### ** Examples

## Example 1: learn an "lda" model on the waveform data using pairwise variable 
## selection (pvs) using "ks.test" and compare it to using lda without pvs 

library("mlbench")
trainset <- mlbench.waveform(300) 
pvsmodel <- pvs(trainset$x, trainset$classes, niveau=0.05) # default: using method="lda"
## short summary, showing the class-pairs of the submodels and the selected variables
pvsmodel
 
testset <-  mlbench.waveform(500)
## prediction of the test data set: 
prediction <- predict(pvsmodel, testset$x)

## calculating the test error rate
1-sum(testset$classes==prediction$class)/length(testset$classes)
## Bayes error is 0.149

## comparison to performance of simple lda
ldamodel <- lda(trainset$x, trainset$classes)
LDAprediction <- predict(ldamodel, testset$x)

## test error rate
1-sum(testset$classes==LDAprediction$class)/length(testset$classes)


## Example 2: learn a "qda" model with pvs on half of the Satellite dataset, 
## using "ks.test" 

library("mlbench")
data("Satellite")

model <- pvs(classes ~ ., Satellite[1:3218,], method="qda", vs.method="ks.test")
## short summary, showing the class-pairs of the submodels and the selected variables
model 

## now predict on the rest of the data set:
## pred <- predict(model,Satellite[3219:6435,]) # takes some time
pred <- predict(model,Satellite[3219:6435,], quick=TRUE) # that's much quicker

## now you can look at the predicted classes:
pred$class 
## or the posterior probabilities:
pred$posterior



