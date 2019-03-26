library(snn)


### Name: myerror
### Title: Classification Error
### Aliases: myerror

### ** Examples


	# Training data
	set.seed(1)
	n = 100
	d = 10
	DATA = mydata(n, d)
	
	# Testing data
	set.seed(2015)
	ntest = 100  
	TEST = mydata(ntest, d)
	TEST.x = TEST[,1:d]
	TEST.y = TEST[,d+1]
	
	## Compute the errors for knn, bnn, ownn, and snn with given parameters.
	predict.knn = myknn(DATA, TEST.x, K = 5)
	predict.bnn = mybnn(DATA, TEST.x, ratio = 0.5)
	predict.ownn = myownn(DATA, TEST.x, K = 5)
	predict.snn = mysnn(DATA, TEST.x, lambda = 10)

	myerror(predict.knn, TEST.y)
	myerror(predict.bnn, TEST.y)
	myerror(predict.ownn, TEST.y)
	myerror(predict.snn, TEST.y)




