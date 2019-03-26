library(snn)


### Name: myknn
### Title: K Nearest Neighbor Classifier
### Aliases: myknn

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
	
	# K nearest neighbor classifier
	myknn(DATA, TEST.x, K = 5)




