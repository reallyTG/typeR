library(RProtoBuf)


### Name: label-methods
### Title: Gets the label of a field
### Aliases: label label-methods LABEL_OPTIONAL LABEL_REQUIRED
###   LABEL_REPEATED
### Keywords: methods

### ** Examples

## Not run: 
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" )
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
 Person <- P("tutorial.Person") 
## End(Don't show)

label(Person$id)
label(Person$email)
label(Person$phone)
label(Person$id, TRUE)
label(Person$email, TRUE)
label(Person$phone, TRUE)
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED



