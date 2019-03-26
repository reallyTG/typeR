library(someMTP)


### Name: draw
### Title: Plots results of fdrOrd()
### Aliases: draw
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(17)
	x=matrix(rnorm(60),3,20)
	x[,1:10]=x[,1:10]+2 ##variables 1:10 have tests under H1
	ts=apply(x,2,function(x) t.test(x)$statistic)
	ps=apply(x,2,function(x) t.test(x)$p.value)
	m2=apply(x^2,2,mean)
	pOrd <- fdrOrd(ps,q=.05,ord=m2)	
	draw(pOrd)



