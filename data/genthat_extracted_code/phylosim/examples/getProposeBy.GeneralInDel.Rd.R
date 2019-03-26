library(phylosim)


### Name: getProposeBy.GeneralInDel
### Title: Get the function used for proposing indel lengths
### Aliases: getProposeBy.GeneralInDel GeneralInDel.getProposeBy
###   getProposeBy,GeneralInDel-method getProposeBy.GeneralInsertor

### ** Examples

	# create a GeneralInDel object
	# proposing events with a constant length of 5
	o<-GeneralInDel(rate=1, propose.by=function(process){return(5)});
	# set/get the proposeBy function
	setProposeBy(o,value=function(process){return(6)})
	getProposeBy(o)
	# set/get proposeBy function via virtual field
	o$proposeBy<-function(process){return(3)}
	o$proposeBy
 


