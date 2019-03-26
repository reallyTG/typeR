library(pheno)


### Name: matrix2raw
### Title: Converts numeric matrix to data frame
### Aliases: matrix2raw
### Keywords: utilities misc

### ** Examples

	data(DWD)
	M <- raw2matrix(DWD)			# conversion to matrix
	D1 <- matrix2raw(M)			# back conversion, but with different level names
	D2 <- matrix2raw(M,c(1951:1998),c(1:9))	# with original level names



