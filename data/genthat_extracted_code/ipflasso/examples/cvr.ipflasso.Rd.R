library(ipflasso)


### Name: cvr.ipflasso
### Title: Cross-validated integrative lasso with fixed penalty factors
### Aliases: cvr.ipflasso

### ** Examples

# load ipflasso library
library(ipflasso)

# generate dummy data
X<-matrix(rnorm(50*200),50,200)
Y<-rbinom(50,1,0.5)

cvr.ipflasso(X=X,Y=Y,family="binomial",standardize=FALSE,
            blocks=list(block1=1:50,block2=51:200), 
            pf=c(1,2),nfolds=5,ncv=10,type.measure="class")



