library(snn)


### Name: mycis
### Title: Classification Instability
### Aliases: mycis

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

	## Compute classification instability for knn, bnn, ownn, and snn with given parameters
	nn=floor(n/2)  
	permIndex = sample(n)
	predict1.knn = myknn(DATA[permIndex[1:nn],], TEST.x, K = 5)
	predict2.knn = myknn(DATA[permIndex[-(1:nn)],], TEST.x, K = 5)
	predict1.bnn = mybnn(DATA[permIndex[1:nn],], TEST.x, ratio = 0.5)
	predict2.bnn = mybnn(DATA[permIndex[-(1:nn)],], TEST.x, ratio = 0.5)
	predict1.ownn = myownn(DATA[permIndex[1:nn],], TEST.x, K = 5)
	predict2.ownn = myownn(DATA[permIndex[-(1:nn)],], TEST.x, K = 5)
	predict1.snn = mysnn(DATA[permIndex[1:nn],], TEST.x, lambda = 10)
	predict2.snn = mysnn(DATA[permIndex[-(1:nn)],], TEST.x, lambda = 10)

	mycis(predict1.knn, predict2.knn)
	mycis(predict1.bnn, predict2.bnn)
	mycis(predict1.ownn, predict2.ownn)
	mycis(predict1.snn, predict2.snn)




