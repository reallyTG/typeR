library(phylosim)


### Name: detachProcess.Sequence
### Title: Detach a Process object from a set of Site objects aggregated by
###   a Sequence object
### Aliases: detachProcess.Sequence Sequence.detachProcess
###   detachProcess,Sequence-method

### ** Examples

	# create a sequence object with two processes attached
	p<-JC69()
	s<-Sequence(length=4,alphabets=list(NucleotideAlphabet()),processes=list(list(p,K80())))
	# get the list of attached processes
	s$processes
	# detach JC69 from range c(1,4)
	detachProcess(s,p,c(1,4))
	s$processes
 


