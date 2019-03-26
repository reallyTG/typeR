library(phylosim)


### Name: rescaleQMatrix.ToleranceSubstitution
### Title: Rescale the scaled rate matrix of a QMatrix object aggregated by
###   a ToleranceSubstitution object
### Aliases: rescaleQMatrix.ToleranceSubstitution
###   ToleranceSubstitution.rescaleQMatrix
###   rescaleQMatrix,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# rescale rate matrix
	rescaleQMatrix(p)
 


