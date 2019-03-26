library(phylosim)


### Name: proposeLength.GeneralInDel
### Title: Propose indel length
### Aliases: proposeLength.GeneralInDel GeneralInDel.proposeLength
###   proposeLength,GeneralInDel-method

### ** Examples

	# create a GeneralInDel object
	# proposing event lengths in the range 1:10
	o<-GeneralInDel(rate=1, propose.by=function(process){sample(c(1:10),1)});
	# propose indel length
	proposeLength(o)
 


