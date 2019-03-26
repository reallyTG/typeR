library(RProtoBuf)


### Name: type-methods
### Title: Gets the type or the C++ type of a field
### Aliases: type type-methods cpp_type cpp_type-methods TYPE_DOUBLE
###   TYPE_FLOAT TYPE_INT64 TYPE_UINT64 TYPE_INT32 TYPE_FIXED64
###   TYPE_FIXED32 TYPE_BOOL TYPE_STRING TYPE_GROUP TYPE_MESSAGE TYPE_BYTES
###   TYPE_UINT32 TYPE_ENUM TYPE_SFIXED32 TYPE_SFIXED64 TYPE_SINT32
###   TYPE_SINT64 CPPTYPE_INT32 CPPTYPE_INT64 CPPTYPE_UINT32 CPPTYPE_UINT64
###   CPPTYPE_DOUBLE CPPTYPE_FLOAT CPPTYPE_BOOL CPPTYPE_ENUM CPPTYPE_STRING
###   CPPTYPE_MESSAGE
### Keywords: methods

### ** Examples

## Not run: 
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" )
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
Person <- P( "tutorial.Person" )
## End(Don't show)
type(Person$id)
type(Person$id, as.string=TRUE)
cpp_type(Person$email)
cpp_type(Person$email, TRUE)



