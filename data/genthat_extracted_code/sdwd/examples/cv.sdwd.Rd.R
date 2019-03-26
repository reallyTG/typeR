library(sdwd)


### Name: cv.sdwd
### Title: cross-validation for the sparse DWD
### Aliases: cv.sdwd
### Keywords: models regression

### ** Examples

data(colon)
colon$x = colon$x[ ,1:100] # this example only uses the first 100 columns 
n = nrow(colon$x)
set.seed(1)
id = sample(n, trunc(n/3))
cvfit = cv.sdwd(colon$x[-id,], colon$y[-id], lambda2=1, nfolds=5)
plot(cvfit)
predict(cvfit, newx=colon$x[id,], s="lambda.min")



