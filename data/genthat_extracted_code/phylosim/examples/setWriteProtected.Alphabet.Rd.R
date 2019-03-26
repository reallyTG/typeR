library(phylosim)


### Name: setWriteProtected.Alphabet
### Title: Set the write protection field for an object
### Aliases: setWriteProtected.Alphabet Alphabet.setWriteProtected
###   setWriteProtected,Alphabet-method

### ** Examples


	# create an object
	o<-Alphabet()
	# toggle write protection
	setWriteProtected(o,TRUE)
	# check write protection
	o$writeProtected
	# set write protection via virtual field
	o$writeProtected<-FALSE
	o$writeProtected


 


