library(RProtoBuf)


### Name: EnumValueDescriptor-class
### Title: Class "EnumValueDescriptor"
### Aliases: EnumValueDescriptor-class show,EnumValueDescriptor-method
###   as.character,EnumValueDescriptor-method
###   toString,EnumValueDescriptor-method $,EnumValueDescriptor-method
###   name,EnumValueDescriptor-method number,EnumValueDescriptor-method
###   enum_type,EnumValueDescriptor,missing,missing-method
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

# enum value type
value(Person$PhoneType, 1)

name(value(Person$PhoneType, 1))
name(value(Person$PhoneType, 1), TRUE)

number(value(Person$PhoneType, number=1))

enum_type(value(Person$PhoneType, number=1))



