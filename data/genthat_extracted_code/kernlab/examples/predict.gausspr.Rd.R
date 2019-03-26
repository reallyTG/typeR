library(kernlab)


### Name: predict.gausspr
### Title: predict method for Gaussian Processes object
### Aliases: predict.gausspr predict,gausspr-method
### Keywords: methods regression classif

### ** Examples


## example using the promotergene data set
data(promotergene)

## create test and training set
ind <- sample(1:dim(promotergene)[1],20)
genetrain <- promotergene[-ind, ]
genetest <- promotergene[ind, ]

## train a support vector machine
gene <- gausspr(Class~.,data=genetrain,kernel="rbfdot",
                kpar=list(sigma=0.015))
gene

## predict gene type probabilities on the test set
genetype <- predict(gene,genetest,type="probabilities")
genetype



