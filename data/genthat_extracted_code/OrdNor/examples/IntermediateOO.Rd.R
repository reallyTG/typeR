library(OrdNor)


### Name: IntermediateOO
### Title: Computes intermediate correlations for ordinal-ordinal pairs
###   before ordinalization
### Aliases: IntermediateOO

### ** Examples

	no.ord=3
	no.norm =4
	n = 200
	q=no.ord + no.norm
	set.seed(12345)
	
	Sigma = diag(q)
	Sigma[lower.tri(Sigma)] = runif( (q*(q-1)/2),-0.4,0.4 )
	Sigma = Sigma + t(Sigma)
	diag(Sigma)=1
	Sigma=as.matrix( nearPD(Sigma,corr = TRUE, keepDiag = TRUE)$mat )

	marginal = list( 0.3, cumsum( c(0.30, 0.40) ), cumsum(c(0.4, 0.2, 0.3) ) )
 
	OOCorrMat = Sigma[1:3, 1:3]
 	IntermediateOO(marginal, OOCorrMat)



