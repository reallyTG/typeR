library(fungible)


### Name: itemDescriptives
### Title: Compute basic descriptives for binary-item analysis
### Aliases: itemDescriptives
### Keywords: statistics

### ** Examples

	## Example 1: generating binary data to match
	## an existing binary data matrix
	##
	## Generate correlated scores using factor 
	## analysis model
	## X <- Z *L' + U*D 
	## Z is a vector of factor scores
	## L is a factor loading matrix
	## U is a matrix of unique factor scores
	## D is a scaling matrix for U

	Nsubj <- 2000
	L <- matrix( rep(.707,5), nrow = 5, ncol = 1)
	Z <-as.matrix(rnorm(Nsubj))
	U <-matrix(rnorm(Nsubj * 5),nrow = Nsubj, ncol = 5)
	tmp <-  sqrt(1 - L^2) 
	D<-matrix(0, 5, 5)
	diag(D) <- tmp
	X <- Z %*% t(L) + U%*%D

	cat("\nCorrelation of continuous scores\n")
	print(round(cor(X),3))

	thresholds <- c(.2,.3,.4,.5,.6)

	Binary<-matrix(0,Nsubj,5)
	for(i in 1:5){
	  Binary[X[,i]<=thresholds[i],i]<-1
	}   

	cat("\nCorrelation of Binary scores\n")
	print(round(cor(Binary),3))

	## Now use 'bigen' to generate binary data matrix with 
	## same correlations as in Binary

	z <- bigen(data = Binary, n = 5000)

	cat("\n\nnames in returned object\n")
	print(names(z))

	cat("\nCorrelation of Simulated binary scores\n")
	print(round( cor(z$data), 3))


	cat("Observed thresholds of simulated data:\n")
	cat( apply(z$data, 2, mean) )
	
	itemDescriptives(z$data)



