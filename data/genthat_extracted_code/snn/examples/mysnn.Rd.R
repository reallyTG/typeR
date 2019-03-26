library(snn)


### Name: mysnn
### Title: Stabilized Nearest Neighbor Classifier
### Aliases: mysnn

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
	
	# stabilized nearest neighbor classifier
	mysnn(DATA, TEST.x, lambda = 10)




