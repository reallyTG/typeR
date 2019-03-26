library(RProtoBuf)


### Name: clear-methods
### Title: Clear a field or all fields of the message and set them to their
###   default values
### Aliases: clear clear-methods clear,Message,character-method
###   clear,Message,integer-method clear,Message,missing-method
###   clear,Message,numeric-method clear,Message,raw-method
### Keywords: methods

### ** Examples

	message <- new( tutorial.Person, name = "dddd", email = "eeeeeee", id = 1 )
	writeLines( as.character( message ) )
	clear( message )
	# clear works also as a pseudo method :
	message$clear() 
	
	writeLines( as.character( message ) )
	
	# clear single fields
	message <- new( tutorial.Person, name = "dddd", email = "eeeeeee", id = 1 )
	message$clear( "name" )
	writeLines( as.character( message ) )
	



