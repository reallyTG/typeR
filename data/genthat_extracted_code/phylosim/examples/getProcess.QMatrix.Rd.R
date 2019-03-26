library(phylosim)


### Name: getProcess.QMatrix
### Title: Get the process object associated with a QMatrix object
### Aliases: getProcess.QMatrix QMatrix.getProcess
###   getProcess,QMatrix-method

### ** Examples

	# Create a GeneralSubstitution object
	p<-GeneralSubstitution(alphabet=BinaryAlphabet())
	p
	# get the associated QMatrix object from p
	m<-p$qMatrix
	summary(m)
	# get the associated process from m
	m$process
	# clone p
	pp<-clone(p)
	# assotiate m with pp
	pp$qMatrix<-m
	# assotiate pp with m
	m$process<-pp
	m$process
 


