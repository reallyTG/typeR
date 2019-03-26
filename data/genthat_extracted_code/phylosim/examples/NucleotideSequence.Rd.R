library(phylosim)


### Name: NucleotideSequence
### Title: The NucleotideSequence class
### Aliases: NucleotideSequence

### ** Examples

	# create an empty NucleotideSequence object
	s<-NucleotideSequence(length=50)
	s
	# set states
	s$states<-c("A","A","G","T")
	s
	# create a sequence object by specifying a string
	s<-NucleotideSequence(string="ATGCCGATTAGCAAA")
	s
 


