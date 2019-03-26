library(phylosim)


### Name: getString.Sequence
### Title: Get the string representation of a Sequence object
### Aliases: getString.Sequence Sequence.getString
###   getString,Sequence-method

### ** Examples

	# create object
	s<-Sequence(length=10)
	# get character representation
	getString(s)	# a bunch of '?'-s
	# get string reperesentation via virtual field
	s$string
 


