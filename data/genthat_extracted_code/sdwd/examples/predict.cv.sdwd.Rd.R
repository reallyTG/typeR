library(sdwd)


### Name: predict.cv.sdwd
### Title: make predictions from a "cv.sdwd" object
### Aliases: predict.cv.sdwd
### Keywords: models regression

### ** Examples

data(colon)
colon$x = colon$x[ ,1:100] # this example only uses the first 100 columns 
set.seed(1)
cv = cv.sdwd(colon$x, colon$y, lambda2=1, nfolds=5)
predict(cv$sdwd.fit, newx=colon$x[2:5, ], 
              s=cv$lambda.1se, type="class")



