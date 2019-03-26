library(rrecsys)


### Name: evalModel
### Title: Creating the evaluation model.
### Aliases: evalModel evalModel,_ds-method evalModel,dataSet-method
###   evalModel,sparseDataSet-method

### ** Examples


x <- matrix(sample(c(0:5), size = 200, replace = TRUE, 
     prob = c(.6,.08,.08,.08,.08,.08)), nrow = 20, byrow = TRUE)

d <- defineData(x)
     
my_2_folds <- evalModel(d, 2)             #output class evalModel.

my_2_folds
# 2 - fold cross validation model on the dataset with 20 users and 10 items.

my_2_folds@data                     #the dataset.
my_2_folds@folds                    #the number of folds in the model.
my_2_folds@fold_indices               #the index of each item in the fold.
     



