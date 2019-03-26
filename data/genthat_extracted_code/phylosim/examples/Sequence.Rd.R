library(phylosim)


### Name: Sequence
### Title: The Sequence class
### Aliases: Sequence

### ** Examples

	# create a sequence object by
	# providng alphabets, processes and states
	s.one<-Sequence(
		name="Seq",
		string="AATTGGCCTTAAGGCCTTAA",
		alphabets=list(NucleotideAlphabet()),
		processes=list(list(JC69()))
	)
	s.one
	# check if inherits from Sequence
	is.Sequence(s.one)
	# get object summary
	summary(s.one)
	# create a sequence object,
	# specifying length, alphabets
	# and ancestral object
	s<-Sequence(
		name="Seq",
		length=20,
		ancestral.obj=s.one
	)
	# get sequence string
	s$string
	# get the list of site objects
	s$sites
	# get object id
	s$id
	# set and get name
	s$name<-"SeqSeq"
	s$seq
	# get length
	s$length
	# get and set ancestral object
	s$ancestral
	s$ancestral<-Sequence();
	# set alphabets
	setAlphabets(s,list(NucleotideAlphabet()))
	# set states
	# "A"-s in the range 1:10
	setStates(s,"A",1:10)
	# a pattern of "ATGC"-s in the range 11:20
	setStates(s,c("A","T","G","C"),11:20)
	# get states from range 10:12
	getStates(s,10:12)
	# attach a JC69 process to range 1:10
	jc69<-JC69()
	attachProcess(s,jc69,1:10)
	# set the rate multiplier site-process specific parameter for jc69
	setParameterAtSites(s,jc69,"rate.multiplier",2,1:10)
	# get "rate.multiplier" for jc69 from range 1:2
	getParameterAtSites(s, jc69, "rate.multiplier",1:2)
	# attach a GTR process to range 11:20
	gtr<-GTR()
	attachProcess(s,gtr,11:20)
	# set and get rate multipliers for gtr
	setRateMultipliers(s, gtr, c(0,5,1), 11:20)
	getRateMultipliers(s, gtr, 11:20)
	# get processes from range 1:5
	getProcesses(s,1:5)
	# replace the processes with a (GTR, JC69), JC69 pattern
	s$processes<-list(list(GTR(), JC69()), list(JC69()))
	# get processes from range 1:2
	getProcesses(s,1:2)
	# get unique processes
	s$uniqueProcesses
	# get unique alphabets
	s$uniqueAlphabets
	# get symbol frequencies
	getSymbolFreqs(s)
	# get the big rate
	s$bigRate
	# get a vector of total rates from range 1:4
	getTotalRatesFromRange(s,1:4)
	# get a vector of cumulative rates from range 1:4
	getCumulativeRatesFromRange(s,1:4)
	# reset all site states
	clearStates(s)
	s
	# sample states from the equilibrium distributions
	# of the attached substitution processes
	sampleStates(s)
	s
	# clone s
	s.clone<-clone(s)
	# insert a sequence in s.clone after position 2
	insertSequence(s.clone,NucleotideSequence(string="AAAAAA"),2)
	s.clone
	# delete positions 1,2,3 and 10
	deleteSubSequence(s.clone, c(1:3,10))
	s.clone
	# copy positions 7:10 into a new sequence object
	sc<-copySubSequence(s.clone, 7:10)
	sc
	# get events from sc in the range 1:2
	getEvents(sc,1:2)
 


