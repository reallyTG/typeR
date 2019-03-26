library(phylosim)


### Name: attachProcess.Sequence
### Title: Attach a Process object to a set of Site objects aggregated by a
###   Sequence object
### Aliases: attachProcess.Sequence Sequence.attachProcess
###   attachProcess,Sequence-method

### ** Examples

	# create a Sequence object of length 6
	s<-Sequence(length=10,alphabets=list(NucleotideAlphabet()))
	# attach a JC69 substitution process
	attachProcess(s,JC69())
	# get the list of attached processes
	s$processes
	# attach the GTR substitution process to range 3:6
	attachProcess(s,GTR(),3:6)
	# get the list of attached processes
	s$processes
 


