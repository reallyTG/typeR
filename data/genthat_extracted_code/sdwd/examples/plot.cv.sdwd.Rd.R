library(sdwd)


### Name: plot.cv.sdwd
### Title: plot the cross-validation curve of the sparse DWD
### Aliases: plot.cv.sdwd
### Keywords: models regression

### ** Examples

data(colon)
colon$x = colon$x[ ,1:100] # this example only uses the first 100 columns 
set.seed(1)
cv = cv.sdwd(colon$x, colon$y, lambda2=1, nfolds=5)
plot(cv)



