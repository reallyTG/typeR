library(kernlab)


### Name: predict.ksvm
### Title: predict method for support vector object
### Aliases: predict.ksvm predict,ksvm-method
### Keywords: methods regression classif

### ** Examples


## example using the promotergene data set
data(promotergene)

## create test and training set
ind <- sample(1:dim(promotergene)[1],20)
genetrain <- promotergene[-ind, ]
genetest <- promotergene[ind, ]

## train a support vector machine
gene <- ksvm(Class~.,data=genetrain,kernel="rbfdot",
             kpar=list(sigma=0.015),C=70,cross=4,prob.model=TRUE)
gene

## predict gene type probabilities on the test set
genetype <- predict(gene,genetest,type="probabilities")
genetype



