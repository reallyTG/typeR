library(phylosim)


### Name: getQMatrix.GeneralSubstitution
### Title: Get the QMatrix object aggregated by a GeneralSubstitution
###   object
### Aliases: getQMatrix.GeneralSubstitution GeneralSubstitution.getQMatrix
###   getQMatrix,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
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
 


