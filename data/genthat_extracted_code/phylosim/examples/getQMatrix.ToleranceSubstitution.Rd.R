library(phylosim)


### Name: getQMatrix.ToleranceSubstitution
### Title: Get the QMatrix object aggregated by a ToleranceSubstitution
###   object
### Aliases: getQMatrix.ToleranceSubstitution
###   ToleranceSubstitution.getQMatrix
###   getQMatrix,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get the QMatrix object
	getQMatrix(p)
	# get the QMatrix object via virtual field
	q<-p$qMatrix
	# tweak with the QMatrix
	setRate(q,"0->1",2)
	# set a new QMatrix for p
	setQMatrix(p,q)
	summary(p)
	# set new QMatrix via virtual field
	setRate(q,"1->0",2)
	p$qMatrix<-q
	summary(p)
 


