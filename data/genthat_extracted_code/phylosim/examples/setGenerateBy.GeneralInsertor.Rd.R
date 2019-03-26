library(phylosim)


### Name: setGenerateBy.GeneralInsertor
### Title: Set the function object used for generating inserts
### Aliases: setGenerateBy.GeneralInsertor GeneralInsertor.setGenerateBy
###   setGenerateBy,GeneralInsertor-method

### ** Examples

	# create a GeneralInsertor object
	i<-GeneralInsertor(
		rate=0.5,
		propose.by=function(process){sample(c(5:10),1)}, # inserts between 5 and 10
		template.seq=NucleotideSequence(string="AAAAAAA")
	)

	# save insert generator
	old.gen<-getGenerateBy(i)
	# set a new insert generator
	i$generateBy<-function(
                           process,
                           length,
                           target.seq,
                           event.pos,
                           insert.pos){
                   return(NucleotideSequence(string="AATTGGCC"))
                   }
	# get the generator function
	i$generateBy
	# generate insert
	generateInsert(i)
	# restore old generator
	i$generateBy<-old.gen
	# generate insert
	generateInsert(i)
 


