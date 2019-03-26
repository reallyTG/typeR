library(someMTP)


### Name: someMTP.object class
### Title: Class "someMTP.object" for storing the result of the function
###   fdrOrd
### Aliases: someMTP.object length-method length summary-method
###   someMTP.object-class show,someMTP.object-method
###   summary,someMTP.object-method length,someMTP.object-method
###   names,someMTP.object-method names<-,someMTP.object-method
###   sort,someMTP.object-method
### Keywords: methods

### ** Examples

    # Simple examples with random data
    set.seed(17)
	x=matrix(rnorm(60),3,20)
	x[,1:10]=x[,1:10]+2 ##variables 1:10 have tests under H1
	ts=apply(x,2,function(x) t.test(x)$statistic)
	ps=apply(x,2,function(x) t.test(x)$p.value)
	m2=apply(x^2,2,mean)
	pOrd <- fdrOrd(ps,q=.05,ord=m2)
	pOrd
    length(pOrd)
	names(pOrd) <- paste("V",1:20,sep="")
	names(pOrd)
	



