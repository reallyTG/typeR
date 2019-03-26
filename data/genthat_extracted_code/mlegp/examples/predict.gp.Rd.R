library(mlegp)


### Name: predict.gp
### Title: Gaussian Process Predictions
### Aliases: predict.gp predictMu predictNewZ calcPredictionError
###   predict.gp.list
### Keywords: models smooth

### ** Examples


x = -5:5; y = sin(x) + rnorm(length(x), sd = 0.001)
fit = mlegp(x,y)
predict(fit, matrix(c(2.4, 3.2)))
## predictions at design points match the observations 
## (because there is no nugget)
round(predict(fit) - fit$Z, 6)   

# this is not necessarily true if there is a nugget
fit = mlegp(x,y, min.nugget = 0.01)
round(predict(fit) - fit$Z,6)   




