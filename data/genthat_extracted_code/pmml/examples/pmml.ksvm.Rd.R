library(pmml)


### Name: pmml.ksvm
### Title: Generate PMML for ksvm objects
### Aliases: pmml.ksvm

### ** Examples

# Train a support vector machine to perform classification.
library(kernlab)
model  <- ksvm(Species ~ ., data=iris)
p <- pmml(model, dataset=iris)

# To make predictions using this model, the new data must be given; 
# without it and by simply using the "predict" function without an 
# input dataset, the predicted value will not be the true predicted 
# value. It will be a raw predicted value which must be 
# post-processed to get the final correct predicted value.

# Make predictions using same iris input data. Even though it is the 
# same dataset, it must be provided as an input parameter for the 
# "predict" function. 

predict(model,iris[,1:4])

rm(model)
rm(p)




