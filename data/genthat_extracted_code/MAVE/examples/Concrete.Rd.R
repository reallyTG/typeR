library(MAVE)


### Name: Concrete
### Title: Concrete Compressive Strength Data Set
### Aliases: Concrete
### Keywords: datasets

### ** Examples

data(Concrete)
train = sample(1:1030)[1:500]
x.train = as.matrix(Concrete[train,1:8])
y.train = as.matrix(Concrete[train,9])
x.test  = as.matrix(Concrete[-train,1:8])
y.test  = as.matrix(Concrete[-train,9])

dr = mave.compute(x.train,y.train, method='meanopg',max.dim=8)
dr.dim = mave.dim(dr)
y.pred = predict(dr.dim,x.test)
#estimation error
mean((y.pred-y.test)^2)




