library(ipflasso)


### Name: cvr2.ipflasso
### Title: Cross-validated integrative lasso with cross-validated penalty
###   factors
### Aliases: cvr2.ipflasso

### ** Examples

# load ipflasso library
library(ipflasso)

# generate dummy data
X<-matrix(rnorm(50*200),50,200)
Y<-rbinom(50,1,0.5)

cvr2.ipflasso(X=X,Y=Y,family="binomial",type.measure="class",standardize=FALSE,
              blocks=list(block1=1:50,block2=51:200),
              pflist=list(c(1,1),c(1,2),c(2,1)),nfolds=5,ncv=10)



