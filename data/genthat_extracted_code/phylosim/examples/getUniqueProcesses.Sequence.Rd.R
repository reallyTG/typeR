library(phylosim)


### Name: getUniqueProcesses.Sequence
### Title: Get the list of unique Process instances attached to the Site
###   objects aggregated by a Sequence object
### Aliases: getUniqueProcesses.Sequence Sequence.getUniqueProcesses
###   getUniqueProcesses,Sequence-method

### ** Examples

	# create a sequence object and attach processes
	p<-JC69()
	s<-Sequence(
               length=4,
               alphabets=list(NucleotideAlphabet()),
               processes=list(list(p,K80()),list(p))
               )
	# get the unique list of attached Process instances
	getUniqueProcesses(s)
	# via virtual field
	s$uniqueProcesses
 


