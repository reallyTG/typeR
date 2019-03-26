library(ipflasso)


### Name: ipflasso.predict
### Title: Using an IPF-lasso model for prediction of new observations
### Aliases: ipflasso.predict

### ** Examples

# load ipflasso library
library(ipflasso)

# generate dummy data
X<-matrix(rnorm(50*200),50,200)
Xtest<-matrix(rnorm(20*200),20,200)
Y<-rbinom(50,1,0.5)

# fitting the IPF-lasso model
model1<-cvr.ipflasso(X=X,Y=Y,family="binomial",standardize=FALSE,
                    blocks=list(block1=1:50,block2=51:200),
                    pf=c(1,2),nfolds=5,ncv=10,type.measure="class")

# making predictions from Xtest
ipflasso.predict(object=model1,Xtest=Xtest)



