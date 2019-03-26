library(RProtoBuf)


### Name: readASCII-methods
### Title: read a message in ASCII format
### Aliases: readASCII readASCII-methods readASCII,Descriptor,ANY-method
###   readASCII,Descriptor,character-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example file that contains a "tutorial.AddressBook" message
##D book <- system.file( "examples", "addressbook.pb", package = "RProtoBuf" )
##D 
##D # read the message
##D message <- read( tutorial.AddressBook, book )
##D 
##D # Output in text format to a temporary file
##D out.file <- tempfile()
##D writeLines( as.character(message), file(out.file))
##D 
##D # Verify that we can read back in the message from a text file.
##D message2 <- readASCII( tutorial.AddressBook, file(out.file, "rb"))
##D 
##D # Verify that we can read back in the message from an unopened file.
##D message3 <- readASCII( tutorial.AddressBook, file(out.file))
##D 
##D \dontshow{
##D stopifnot( identical( message, message2) )
##D }
## End(Not run)



