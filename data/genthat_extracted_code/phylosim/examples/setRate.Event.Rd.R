library(phylosim)


### Name: setRate.Event
### Title: Set the rate of an Event object
### Aliases: setRate.Event Event.setRate setRate,Event-method

### ** Examples

	# create an Event object
	e<-Event(rate=0.1)
	# set  a new rate
	setRate(e,0.2)
	# get rate via virtual field
	e$rate
	# set rate via virtual field
	e$rate<-0.5
	e$rate
 


