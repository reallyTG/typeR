library(phylosim)


### Name: getAcceptBy.GeneralInDel
### Title: Get the function used for accepting/rejecting indel events
### Aliases: getAcceptBy.GeneralInDel GeneralInDel.getAcceptBy
###   getAcceptBy,GeneralInDel-method getAcceptBy.GeneralInsertor

### ** Examples

	# create a GeneralInDel object
	# rejecting half of the events
	o<-GeneralInDel(
                   rate=1,
                   propose.by=function(process){return(5)},
                   accept.by=function( ){sample(c(TRUE,FALSE),1)}
                   );
	# set/get the acceptBy function
	setAcceptBy(o,value=function(){return(FALSE)})	# reject all events
	getAcceptBy(o)
	# set/get acceptBy function via virtual field
	o$acceptBy<-function(){return(TRUE)}		# accept all events
	o$acceptBy
 


