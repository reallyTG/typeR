library(ipflasso)


### Name: cvr.glmnet
### Title: Repeating cv.glmnet
### Aliases: cvr.glmnet

### ** Examples

# load ipflasso library
library(ipflasso)

# generate dummy data
X<-matrix(rnorm(50*200),50,200)
Y<-rbinom(50,1,0.5)

cvr.glmnet(X=X,Y=Y,family="binomial",standardize=FALSE,nfolds=5,ncv=10,type.measure="class")



