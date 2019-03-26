library(RProtoBuf)


### Name: number-methods
### Title: Gets the declared tag number of a field
### Aliases: number number-methods
### Keywords: methods

### ** Examples

## Not run: 
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" )
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
 Person <- P("tutorial.Person") 
## End(Don't show)

number(Person$id)
number(Person$email)
as.character(Person)

number(value(tutorial.Person$PhoneType, name="HOME"))



