library(kernlab)


### Name: promotergene
### Title: E. coli promoter gene sequences (DNA)
### Aliases: promotergene
### Keywords: datasets

### ** Examples

data(promotergene)

## Create classification model using Gaussian Processes

prom <- gausspr(Class~.,data=promotergene,kernel="rbfdot",
                kpar=list(sigma=0.02),cross=4)
prom

## Create model using Support Vector Machines

promsv <- ksvm(Class~.,data=promotergene,kernel="laplacedot",
               kpar="automatic",C=60,cross=4)
promsv



