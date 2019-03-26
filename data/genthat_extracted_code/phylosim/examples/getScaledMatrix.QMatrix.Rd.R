library(phylosim)


### Name: getScaledMatrix.QMatrix
### Title: Get the scaled rate matrix form a QMatrix object
### Aliases: getScaledMatrix.QMatrix QMatrix.getScaledMatrix
###   getScaledMatrix,QMatrix-method

### ** Examples

       # create a GeneralSubstitution object
       # provide an Alphabet object and the rates
       p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# get the QMatrix object from p
	m<-p$QMatrix
	# get the scaled rate matrix from m
	m$scaledMatrix
 


