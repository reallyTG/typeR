library(phylosim)


### Name: getProcesses.Sequence
### Title: Get the Process objects attached to the Site objects aggregated
###   by a Sequence object
### Aliases: getProcesses.Sequence Sequence.getProcesses
###   getProcesses,Sequence-method

### ** Examples

	# create a sequence object with some processes attached
	s<-Sequence(
               length=4,
               alphabets=list(NucleotideAlphabet()),
               processes=list(list(JC69(),K80()),list(GTR()))
               )
	# get the list of lists of attached processes from positions 1 and 3
	getProcesses(s,c(1,3))
	# get processes via virtual field
	s$processes
 


