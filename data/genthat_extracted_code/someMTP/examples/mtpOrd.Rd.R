library(someMTP)


### Name: fdrOrd/kfweOrd
### Title: Controlling the False Discovery Rate and and the Generalized
###   FWER in ordered Test
### Aliases: fdrOrd kfweOrd
### Keywords: htest

### ** Examples



	set.seed(17)
	x=matrix(rnorm(60),3,20)
	x[,1:10]=x[,1:10]+2 ##variables 1:10 have tests under H1
	ts=apply(x,2,function(x) t.test(x)$statistic)
	ps=apply(x,2,function(x) t.test(x)$p.value) #compute p-values
	m2=apply(x^2,2,mean)           #compute ordering criterion

	pOrd <- fdrOrd(ps,q=.05,ord=m2)   #ordinal Procedure
	pOrd
	draw(pOrd)	
	sum(p.adjust(ps,method="BH")<=.05)  #rejections with BH
	
	kOrd <- kfweOrd(ps,k=5,ord=m2)#ordinal procedure
	kOrd
	kOrdGD <- kfweOrd(ps,k=5,ord=m2,GD=TRUE)#ord. proc. (any dependence)
	kOrdGD



