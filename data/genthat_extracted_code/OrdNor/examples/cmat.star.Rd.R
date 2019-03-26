library(OrdNor)


### Name: cmat.star
### Title: Computes the correlation of intermediate multivariate normal
###   data before subsequent ordinalization
### Aliases: cmat.star

### ** Examples

	Sigma = diag(4)
	Sigma[lower.tri(Sigma)] = c(0.42, 0.78, 0.29, 0.37, 0.14, 0.26)
	Sigma = Sigma + t(Sigma)
	diag(Sigma)=1

	marginal = list( c(0.2, 0.5), c(0.4, 0.7, 0.9))
	cmat.star(marginal, Sigma, 2, 2) 



