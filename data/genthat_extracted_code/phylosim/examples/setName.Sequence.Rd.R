library(phylosim)


### Name: setName.Sequence
### Title: Set the name of a Sequence object
### Aliases: setName.Sequence Sequence.setName setName,Sequence-method

### ** Examples

	# create a Sequence object
	s<-Sequence(name="MySeq",length=4)
	# get sequence name
	s$name
	# rename object
	setName(s,"SO")
	s$name
	# rename via virtual field
	s$name<-"SeqSeq"
	s$name
 


