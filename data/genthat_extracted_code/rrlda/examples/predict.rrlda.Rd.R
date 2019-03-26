library(rrlda)


### Name: predict.rrlda
### Title: Class Prediction for rrlda objects
### Aliases: predict.rrlda predict
### Keywords: file

### ** Examples

	data(iris)
	x <- iris[,1:4]
	rr <- rrlda(x, grouping=as.numeric(iris[,5]), lambda=0.2, hp=0.75) ## perform rrlda
	pred <- predict(rr, x) ## predict 
	table(as.numeric(pred$class), as.numeric(iris[,5])) ## show errors



