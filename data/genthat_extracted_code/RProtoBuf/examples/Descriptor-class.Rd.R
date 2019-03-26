library(RProtoBuf)


### Name: Descriptor-class
### Title: Class "Descriptor"
### Aliases: Descriptor-class as.character,Descriptor-method
###   $<-,Descriptor-method $,Descriptor-method new,Descriptor-method
###   show,Descriptor-method toString,Descriptor-method
###   containing_type,Descriptor-method field_count,Descriptor-method
###   nested_type_count,Descriptor-method enum_type_count,Descriptor-method
###   field,Descriptor-method nested_type,Descriptor-method
###   enum_type,Descriptor,ANY,ANY-method [[,Descriptor-method
###   names,Descriptor-method length,Descriptor-method
### Keywords: classes

### ** Examples

## Not run: 
##D # example proto file supplied with this package
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" ) 
##D # reading a proto file and creating the descriptor
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
Person <- P( "tutorial.Person" ) 
## End(Don't show)

# enum type
Person$PhoneType

# nested type
Person$PhoneNumber

# field
Person$email

# use this descriptor to create a message
new( Person )



