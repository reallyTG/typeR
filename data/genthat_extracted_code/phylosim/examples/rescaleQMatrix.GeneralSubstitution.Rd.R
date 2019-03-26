library(phylosim)


### Name: rescaleQMatrix.GeneralSubstitution
### Title: Rescale the scaled rate matrix of a QMatrix object aggregated by
###   a GeneralSubstitution object
### Aliases: rescaleQMatrix.GeneralSubstitution
###   GeneralSubstitution.rescaleQMatrix
###   rescaleQMatrix,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# rescale rate matrix
	rescaleQMatrix(p)
 


