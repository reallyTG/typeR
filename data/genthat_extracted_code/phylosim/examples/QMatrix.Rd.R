library(phylosim)


### Name: QMatrix
### Title: The QMatrix class
### Aliases: QMatrix

### ** Examples

	# create a QMatrix object by providing an Alphabet object and rates
	m<-QMatrix(name="Susie Q", alphabet=BinaryAlphabet(), rate.list=list("1->0"=2,"0->1"=3))
	# get object summary
	summary(m)
       # create a GeneralSubstitution object by
       # providing an Alphabet object and the rates
       p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
       # get the QMatrix object from p
       m<-p$QMatrix
	# get various object properties
	m
	is.QMatrix(m)
	m$name
	m$id
	m$alphabet
	# get the associated process
	m$process
	# get the unscaled rate of "0->1"
	getRate(m,"0->1")
	# get the scaled rate of "0->1"
	getEventRate(m,"0->1")
	# get the list of unscaled rates
	m$rateList
	# get unscaled rate matrix
	m$matrix
	# get scaled rate matrix
	m$scaledMatrix
 


