library(qut)


### Name: predict.qut
### Title: Make predictions from a "qut" object.
### Aliases: predict.qut coef.qut

### ** Examples

	set.seed(1234)
	x=matrix(rnorm(200*20),200,20)
	y1=x[,1]*10+rnorm(100)

	fit1=qut(y1,x,family=gaussian,sigma=1)
	predict(fit1,newx=x[1:5,])
	predict(fit1,newx=x[1:5,],mode='lasso')
	y1[1:5]
	
	coef(fit1,mode='lasso')
	coef(fit1,mode='glm')




