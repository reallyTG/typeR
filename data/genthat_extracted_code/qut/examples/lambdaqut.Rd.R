library(qut)


### Name: lambdaqut
### Title: Quantile Universal Threshold, regularization parameter for
###   GLM-lasso
### Aliases: lambdaqut

### ** Examples

	X=matrix(rnorm(20*200),20,200)
	y=rnorm(20)+1
	lambda=lambdaqut(y,X,family=gaussian)
	



