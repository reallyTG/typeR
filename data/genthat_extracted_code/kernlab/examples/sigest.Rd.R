library(kernlab)


### Name: sigest
### Title: Hyperparameter estimation for the Gaussian Radial Basis kernel
### Aliases: sigest sigest,formula-method sigest,matrix-method
### Keywords: classif regression

### ** Examples


## estimate good sigma values for promotergene
data(promotergene)
srange <- sigest(Class~.,data = promotergene)
srange

s <- srange[2]
s
## create test and training set
ind <- sample(1:dim(promotergene)[1],20)
genetrain <- promotergene[-ind, ]
genetest <- promotergene[ind, ]

## train a support vector machine
gene <- ksvm(Class~.,data=genetrain,kernel="rbfdot",
             kpar=list(sigma = s),C=50,cross=3)
gene

## predict gene type on the test set
promoter <- predict(gene,genetest[,-1])

## Check results
table(promoter,genetest[,1])



