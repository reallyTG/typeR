library(phylosim)


### Name: getInsertHook.GeneralInsertor
### Title: Get the insert hook function
### Aliases: getInsertHook.GeneralInsertor GeneralInsertor.getInsertHook
###   getInsertHook,GeneralInsertor-method

### ** Examples

	# create a GeneralInsertor object
	i<-GeneralInsertor(
		rate=0.5,
		propose.by=function(process){sample(c(5:10),1)}, # inserts between 5 and 10
		template.seq=NucleotideSequence(length=5,processes=list(list(JC69())))
	)
	# set a dummy insert hook
	setInsertHook(i,function(seq){return(seq)})
	# set a new insert hook via virtual field
	i$insertHook<-function(seq){
		seq$processes<-list(list(GTR())) # replace the subsitution process
		return(seq)
	}
	# get the insert hook via virtual field
	i$insertHook
	# get the insert hook
	getInsertHook(i)
 


