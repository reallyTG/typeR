library(phylosim)


### Name: Scale.QMatrix
### Title: Scale the scaled rate matrix stored in a QMatrix object by the
###   provided factor
### Aliases: Scale.QMatrix QMatrix.Scale Scale,QMatrix-method

### ** Examples

	# create a QMatrix object
	# , provide Alphabet object and rates
	m<-QMatrix(name="Susie Q", alphabet=BinaryAlphabet(), rate.list=list("1->0"=2,"0->1"=3))
	# get object summary
	summary(m)
	# perform scaling
	Scale(m, 1/0.666)
	# get object summary
	summary(m)
 


