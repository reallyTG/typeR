library(phylosim)


### Name: getAncestral.Sequence
### Title: Get the ancestral object of a Sequence object
### Aliases: getAncestral.Sequence Sequence.getAncestral
###   getAncestral,Sequence-method

### ** Examples

	# create a sequence object
	s<-Sequence(length=4)
	# get ancestral object
	getAncestral(s)	# newly created sequences have the "Root insertion process" as ancestral
	# clone sequence
	cs<-clone(s)
	# get ancestral object id via virtual field
	cs$ancestral$id
 


