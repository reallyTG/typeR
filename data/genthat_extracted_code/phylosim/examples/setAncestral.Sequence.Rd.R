library(phylosim)


### Name: setAncestral.Sequence
### Title: Set the ancestral object of a Sequence object
### Aliases: setAncestral.Sequence Sequence.setAncestral
###   setAncestral,Sequence-method

### ** Examples

	# create a nucleotide sequence and a process object
	s<-NucleotideSequence(string="AGCT")
	p<-Process(name="MyProcess")
	# set the p as the ancestral of s
	setAncestral(s,p)
	s$ancestral
	# clone s
	cs<-clone(s)
	# set cs as ancestral of s via virtual field
	s$ancestral<-cs
	# get ancestral ids
	s$ancestral$id
	cs$ancestral$id
 


