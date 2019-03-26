library(yakmoR)


### Name: orthoKMeansPredict
### Title: orthogonal kmeans prediction function
### Aliases: orthoKMeansPredict

### ** Examples

obj = yakmoR::orthoKMeansTrain (x = as.matrix(iris[seq(1,150,2),1:4]),
			k = 3, rounds = 3)
	predictions = yakmoR::orthoKMeansPredict (x = as.matrix(iris[seq(2, 150, 2),1:4]),
			obj = obj)



