library(phylosim)


### Name: generateInsert.GeneralInsertor
### Title: Generate an insert
### Aliases: generateInsert.GeneralInsertor GeneralInsertor.generateInsert
###   generateInsert,GeneralInsertor-method

### ** Examples

	# build the template sequence
	ts<-NucleotideSequence(length = 10,processes=list(list(JC69())));
	# fix some site states
	setStates(ts,"A",c(1,2));
	setStates(ts,"T",c(5,6));
	setStates(ts,"C",c(9,10));
	# print template sequence
	ts
	# create a GeneralInsertor object
	i<-GeneralInsertor(
		rate=0.5,
		template.seq=ts,
		propose.by=function(process){sample(c(5:50),1)}, # inserts between 5 and 50
	)
	# generate some inserts
	generateInsert(i)
	generateInsert(i)
	generateInsert(i)
	generateInsert(i)
 


