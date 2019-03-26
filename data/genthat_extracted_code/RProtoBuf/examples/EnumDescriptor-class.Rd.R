library(RProtoBuf)


### Name: EnumDescriptor-class
### Title: Class "EnumDescriptor"
### Aliases: EnumDescriptor-class show,EnumDescriptor-method
###   has,EnumDescriptor-method as.character,EnumDescriptor-method
###   toString,EnumDescriptor-method $,EnumDescriptor-method
###   containing_type,EnumDescriptor-method length,EnumDescriptor-method
###   value_count value_count-methods value_count,EnumDescriptor-method
###   value value-methods value,EnumDescriptor-method
###   [[,EnumDescriptor-method names,EnumDescriptor-method
### Keywords: classes

### ** Examples

## Not run: 
##D # example proto file supplied with this package
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" ) 
##D 
##D # reading a proto file and creating the descriptor
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
Person <- P("tutorial.Person") 
## End(Don't show)
# enum type
Person$PhoneType

has(Person$PhoneType, "MOBILE")
has(Person$PhoneType, "HOME")
has(Person$PhoneType, "WORK")

has(Person$PhoneType, "FOOBAR")

length(Person$PhoneType)



