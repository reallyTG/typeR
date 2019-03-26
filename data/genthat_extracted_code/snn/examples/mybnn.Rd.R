library(snn)


### Name: mybnn
### Title: Bagged Nearest Neighbor Classifier
### Aliases: mybnn

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
	
	# bagged nearest neighbor classifier
	mybnn(DATA, TEST.x, ratio = 0.5)




