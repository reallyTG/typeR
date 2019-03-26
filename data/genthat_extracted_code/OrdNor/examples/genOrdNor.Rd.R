library(OrdNor)


### Name: genOrdNor
### Title: Generates a data set with ordinal and normal variables
### Aliases: genOrdNor

### ** Examples

	Sigma = diag(4)
	Sigma[lower.tri(Sigma)] = c(0.42, 0.78, 0.29, 0.37, 0.14, 0.26)
	Sigma = Sigma + t(Sigma)
	diag(Sigma)=1

	marginal = list( c(0.2, 0.5), c(0.4, 0.7, 0.9))
	cmat= cmat.star(marginal, Sigma, 2, 2)  
	mean.vec = c(2,4)
	sd.vec = c(0.5, 1.5)
	Y=genOrdNor(10000,marginal, cmat, mean.vec, sd.vec, 2, 2)
	cor(Y)



