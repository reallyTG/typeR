library(phylosim)


### Name: setWriteProtected.Sequence
### Title: Set the write protection field for an object
### Aliases: setWriteProtected.Sequence Sequence.setWriteProtected
###   setWriteProtected,Sequence-method

### ** Examples


	# create an object
	o<-Sequence()
	# toggle write protection
	setWriteProtected(o,TRUE)
	# check write protection
	o$writeProtected
	# set write protection via virtual field
	o$writeProtected<-FALSE
	o$writeProtected


 


