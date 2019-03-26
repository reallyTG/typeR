library(RProtoBuf)


### Name: read-methods
### Title: Read a protocol buffer message from a connection
### Aliases: read read-methods read,Descriptor,character-method
###   read,Descriptor,raw-method read,Descriptor,ANY-method
### Keywords: methods

### ** Examples

# example file that contains a "tutorial.AddressBook" message
book <- system.file( "examples", "addressbook.pb", package = "RProtoBuf" )

# read the message
message <- read( tutorial.AddressBook, book )

# or using the pseudo method 
message <- tutorial.AddressBook$read( book )

# write its debug string
writeLines( as.character( message ) )

# grab the name of each person
sapply( message$person, function(p) p$name )

# read from a binary file connection
f <- file( book, open = "rb" )
message2 <- read( tutorial.AddressBook, f )
close( f )

# read from a message payload (raw vector)
payload <- readBin( book, raw(0), 5000 )
message3 <- tutorial.AddressBook$read( payload )

## Don't show: 
stopifnot( identical( message, message2) )
stopifnot( identical( message, message3) )
## End(Don't show)




