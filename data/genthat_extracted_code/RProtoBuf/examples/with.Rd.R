library(RProtoBuf)


### Name: with.Message
### Title: with and within methods for protocol buffer messages
### Aliases: with.Message within.Message
### Keywords: classes

### ** Examples

## Not run: 
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" ) 
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
Person <- P( "tutorial.Person") 
## End(Don't show)
romain <- within( new( Person ), {
	email <- "francoisromain@free.fr"
	id <- 10L
} )



