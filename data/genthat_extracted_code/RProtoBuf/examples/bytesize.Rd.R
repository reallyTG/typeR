library(RProtoBuf)


### Name: bytesize-methods
### Title: The number of bytes taken by a message
### Aliases: bytesize bytesize-methods bytesize,Message-method
### Keywords: methods

### ** Examples

	message <- new( tutorial.Person, name = "dddd", email = "eeeeeee", id = 1 )
	bytesize( message )
	## Don't show: 
		stopifnot( identical( bytesize(message), length(serialize(message, NULL ) ) ) )
	
## End(Don't show)



