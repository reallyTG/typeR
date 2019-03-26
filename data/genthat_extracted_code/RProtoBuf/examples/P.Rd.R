library(RProtoBuf)


### Name: P
### Title: Protocol Buffer descriptor importer
### Aliases: P
### Keywords: interface

### ** Examples

## Not run: 
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" ) 
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
 Person <- P("tutorial.Person") 
## End(Don't show)

cat(as.character( Person ))



