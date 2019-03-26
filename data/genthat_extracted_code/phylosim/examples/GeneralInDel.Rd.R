library(phylosim)


### Name: GeneralInDel
### Title: The GeneralInDel class
### Aliases: GeneralInDel

### ** Examples

	# create a GeneralInDel object
	# rejecting half of the events
	# and proposing sizes in the range 1:10
	o<-GeneralInDel(
                   rate=1,
                   propose.by=function(process){sample(1:10,1)},
                   accept.by=function(){sample(c(TRUE,FALSE),1)}
                   );
	# check if inherits from GeneralInDel
	is.GeneralInDel(o)
	# check if it has undefined rates
	hasUndefinedRate(o)
	# get object summary
	summary(o)
	# set/get proposeBy function via virtual field
	o$proposeBy<-function(process){return(3)}	# fixed event length
	o$proposeBy
	# set/get acceptBy function via virtual field
	o$acceptBy<-function(){return(TRUE)}		# accept all events
	o$acceptBy
	# get/set general rate
	o$rate
	o$rate<-2	# double the rate
	# propose event length
	proposeLength(o)
 


