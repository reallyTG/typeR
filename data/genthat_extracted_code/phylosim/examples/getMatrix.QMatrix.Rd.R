library(phylosim)


### Name: getMatrix.QMatrix
### Title: Get the unscaled rate matrix form a QMatrix object
### Aliases: getMatrix.QMatrix QMatrix.getMatrix getMatrix,QMatrix-method

### ** Examples

       # create a GeneralSubstitution object
       # provide an Alphabet object and the rates
       p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# get the QMatrix object from p
	m<-p$QMatrix
	# get the unscaled rate matrix from m
	m$matrix
 


