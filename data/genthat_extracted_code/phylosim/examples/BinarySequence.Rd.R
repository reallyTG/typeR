library(phylosim)


### Name: BinarySequence
### Title: The BinarySequence class
### Aliases: BinarySequence

### ** Examples

	# create an empty BinarySequence object
	s<-BinarySequence(length=50)
	s
	# set states
	s$states<-c(0,0,1,0,1,1)
	s
	# create a sequence object by specifying a string
	s<-BinarySequence(string="00000110010001111")
	s
 


