library(phylosim)


### Name: getTemplateSeq.GeneralInsertor
### Title: Get the template sequence object
### Aliases: getTemplateSeq.GeneralInsertor GeneralInsertor.getTemplateSeq
###   getTemplateSeq,GeneralInsertor-method

### ** Examples

	# create a GeneralInsertor object
	i<-GeneralInsertor(
		rate=0.5,
		propose.by=function(process){sample(c(5:10),1)}, # inserts between 5 and 10
		template.seq=NucleotideSequence(string="AAAAAAA")
	)
	# get template sequence
	getTemplateSeq(i)
	# get template sequence via virtual field
	i$templateSeq
	# set template sequence
	setTemplateSeq(i, NucleotideSequence(string="C"));
	# generate insert
	generateInsert(i)
	# set template sequence via virtual field
	i$templateSeq<-NucleotideSequence(string="G")
	# generate insert
	generateInsert(i)
 


