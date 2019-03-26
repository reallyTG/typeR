library(phylosim)


### Name: sampleStates.Sequence
### Title: Sample the states for a collection of Site objects aggregated by
###   a Sequence object
### Aliases: sampleStates.Sequence Sequence.sampleStates
###   sampleStates,Sequence-method

### ** Examples

	# create a nucleotide sequence
	s<-NucleotideSequence(length=80)
	# create some processes
	jc69<-JC69(); 				# Jukes-Cantor
	hky<-HKY(base.freqs=c(0.1,0.4,0.1,0.4)) # "GC-rich" HKY
	# attach the processes
	s$processes<-list(list(jc69)) # jc is attached to all sites
	attachProcess(s,hky,60:80)  # hky is attached to range 60:80
	# tweak rate multiplier for hky
	setRateMultipliers(s,hky,10,60:80)
	# set states in range 1:20
	setStates(s,"A",1:20)
	# sample remaining states
	sampleStates(s)
	# print sequence
	s
 


