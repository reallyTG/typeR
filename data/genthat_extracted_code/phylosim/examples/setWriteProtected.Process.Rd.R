library(phylosim)


### Name: setWriteProtected.Process
### Title: Set the write protection field for an object
### Aliases: setWriteProtected.Process Process.setWriteProtected
###   setWriteProtected,Process-method

### ** Examples


	# create an object
	o<-Process()
	# toggle write protection
	setWriteProtected(o,TRUE)
	# check write protection
	o$writeProtected
	# set write protection via virtual field
	o$writeProtected<-FALSE
	o$writeProtected


 


