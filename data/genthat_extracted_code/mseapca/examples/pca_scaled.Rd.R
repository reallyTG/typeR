library(mseapca)


### Name: pca_scaled
### Title: PCA for autoscaled data
### Aliases: pca_scaled
### Keywords: pca/msea

### ** Examples

	# --------------
	#  Sample data
	# --------------
	X <- matrix(runif(1000),nrow=100,ncol=10) # 100(metabolites)*10(samples)
	M <- as.character(c(1:100)) # metabolite IDs
	D <- data.frame(M,X)	# dataframe of metabolite IDs and data matrix

	# ---------------------------
	#  PCA for autoscaled data
	# ---------------------------
	A <- pca_scaled(D) 		# automatically scaled in pca_scaled function

	# ---------
	#  Result
	# ---------
	A[["score"]]			# PC score
	A[["factor.loading"]] 		# factor loading
	A[["p.value"]] 			# p-value of factor loading
	A[["q.value"]] 			# q-value of factor loading



