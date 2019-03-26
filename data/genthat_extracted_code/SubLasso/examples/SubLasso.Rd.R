library(SubLasso)


### Name: SubLasso
### Title: Logistic model via Lasso penalty with a subset features
### Aliases: SubLasso

### ** Examples
 
#screen device is not support in examples but SubLasso function use it to visualize results.
#when you want to test examples, please uncomment following code.

##### Example 1
#data(Golub_Merge)
#X <- Golub_Merge$X
#y <- Golub_Merge$y
#f1=SubLasso(X,y,nfold=10)

## predict.sublasso(f1,X[1:10,]) ##error predicted x
#predy=predict.sublasso(f1,X)
#predy=predict.sublasso(f1,X,type="class")
#predy=predict.sublasso(f1,X,type="link")
#predy=predict.sublasso(f1,X,type="response")
#predy=predict.sublasso(f1,X,type="response",s=0.05)
#subset=f1$selname
#f2=SubLasso(X,y,subset,nfold=10)

#subset=row.names(X)[1:10]
#f3=SubLasso(X,y,subset,nfold=10)

#predy=predict.sublasso(f3,X)
#predy=predict.sublasso(f3,X,type="class")
#predy=predict.sublasso(f3,X,type="link")
#predy=predict.sublasso(f3,X,type="response")
#predy=predict.sublasso(f3,X,type="response",s=0.05)

###Example 2

#data(Colon)
#X<-t(Colon$X)
#y_tmp<-Colon$Y
#y<-ifelse(y_tmp==1,1,0)
#f1=SubLasso(X,y,nfold=10)
#subset=f1$selname
#f2=SubLasso(X,y,subset,nfold=10)
#subset=row.names(X)[30:40]
#f3=SubLasso(X,y,subset,nfold=10)





