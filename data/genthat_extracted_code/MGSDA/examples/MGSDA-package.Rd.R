library(MGSDA)


### Name: MGSDA-package
### Title: MGSDA: Multi-Group Sparse Discriminant Analysis
### Aliases: MGSDA-package MGSDA

### ** Examples

### Example 1
# generate training data
n <- 10
p <- 100
G <- 3
ytrain <- rep(1:G,each=n)
set.seed(1)
xtrain <- matrix(rnorm(p*n*G),n*G,p)
# find matrix of canonical vectors V
V <- dLDA(xtrain,ytrain,lambda=0.1)
sum(rowSums(V)!=0)
# generate test data
m <- 20
set.seed(3)
xtest <- matrix(rnorm(p*m),m,p)
# perform classification
ytest <- classifyV(xtrain,ytrain,xtest,V)



