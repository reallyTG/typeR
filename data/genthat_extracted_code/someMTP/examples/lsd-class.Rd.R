library(someMTP)


### Name: lsd.object class
### Title: Class "lsd.object" for storing the result of the function lsd
### Aliases: lsd.object lsd.object-class show,lsd.object-method
###   p.value,lsd.object-method summary,lsd.object-method
###   weights,lsd.object-method summary p.value weights
### Keywords: methods

### ** Examples

    # Simple examples with random data here
    set.seed(1)
	#Standard multivariate LSD test for one sample case
	X=matrix(rnorm(50),5,10)+5
	res <- lsd.test(resp=X,alternative=~1)
	print(res)
	p.value(res)
    summary(res,showD=TRUE)



