library(MAVE)


### Name: predict.mave
### Title: Make predictions based on the dimension reduction space
### Aliases: predict.mave predict.mave.dim

### ** Examples


X = matrix(rnorm(10000),1000,10)
beta1 = as.matrix(c(1,1,1,1,0,0,0,0,0,0))
beta2 = as.matrix(c(0,0,0,1,1,1,1,1,0,0))
err = as.matrix(rnorm(1000))
Y = X%*%beta1+X%*%beta2+err

train = sample(1:1000)[1:500]
x.train = X[train,]
y.train = as.matrix(Y[train])
x.test = X[-train,]
y.test = as.matrix(Y[-train])

dr = mave(y.train~x.train, method = 'meanopg')

yp = predict(dr,x.test,dim=3,degree=2)
#mean error
mean((yp-y.test)^2)

dr.dim = mave.dim(dr)

yp = predict(dr.dim,x.test,degree=2)
#mean error
mean((yp-y.test)^2)




