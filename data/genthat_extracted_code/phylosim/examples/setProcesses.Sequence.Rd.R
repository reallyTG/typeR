library(phylosim)


### Name: setProcesses.Sequence
### Title: Specify a set of Process objects to be attached to a set of Site
###   objects aggregated by a Sequence object
### Aliases: setProcesses.Sequence Sequence.setProcesses
###   setProcesses,Sequence-method

### ** Examples

	# create a sequence of length 5
	s<-Sequence(length=5,alphabets=list(NucleotideAlphabet()));
	# set a pattern of processes
	setProcesses(s,list(list(JC69(),K81())))
	# get attached processes
	s$processes
	# detach all processes from range 1:3
	setProcesses(s,list(list()),1:3)
	s$processes
	# detach all processes via virtual field
	s$processes<-list(list())
	# create a process pattern in the full sequence via virtual field
	s$processes<-list(list(JC69()),list(GTR(),K80()))
	s$processes
 


