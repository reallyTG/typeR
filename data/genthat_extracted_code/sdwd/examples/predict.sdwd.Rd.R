library(sdwd)


### Name: predict.sdwd
### Title: make predictions for the sparse DWD
### Aliases: predict.sdwd
### Keywords: models regression

### ** Examples

data(colon)
fit = sdwd(colon$x, colon$y, lambda2=1)
print(predict(fit ,type="class",newx=colon$x[2:5,]))



