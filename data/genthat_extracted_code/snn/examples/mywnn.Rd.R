library(snn)


### Name: mywnn
### Title: Weighted Nearest Neighbor Classifier
### Aliases: mywnn

### ** Examples


	set.seed(1)
	n = 100
	d = 10
	DATA = mydata(n, d)

	## weighted nearest neighbor classifier
	weight.vec = c(rep(0.02,50), rep(0,50))
	mywnn(DATA, rep(-5,d), weight = weight.vec)




