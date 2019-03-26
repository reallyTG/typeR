library(RProtoBuf)


### Name: FieldDescriptor-class
### Title: Class "FieldDescriptor"
### Aliases: FieldDescriptor-class show,FieldDescriptor-method
###   $,FieldDescriptor-method as.character,FieldDescriptor-method
###   toString,FieldDescriptor-method
###   containing_type,FieldDescriptor-method
###   is_extension,FieldDescriptor-method number,FieldDescriptor-method
###   type,FieldDescriptor-method cpp_type,FieldDescriptor-method
###   label,FieldDescriptor-method is_required is_optional is_repeated
###   is_required-methods is_optional-methods is_repeated-methods
###   is_required,FieldDescriptor-method is_optional,FieldDescriptor-method
###   is_repeated,FieldDescriptor-method has_default_value
###   has_default_value-methods has_default_value,FieldDescriptor-method
###   default_value default_value-methods
###   default_value,FieldDescriptor-method message_type
###   message_type-methods message_type,FieldDescriptor-method
###   enum_type,FieldDescriptor,missing,missing-method
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

# field descriptor object
Person$email

# debug string
as.character( Person$email )

# or as a pseudo method
Person$email$as.character()

Person$email$is_required()
Person$email$is_optional()
Person$email$is_repeated()

Person$email$has_default_value()
Person$email$default_value()

Person$email$is_extension()

# Get the default values
has_default_value(Person$id)
has_default_value(Person$email)
has_default_value(Person$phone)
default_value(Person$id)
default_value(Person$email)
default_value(Person$phone)

# Get the types of field descriptors
type(Person$id)
type(Person$id, as.string=TRUE)
cpp_type(Person$email)
cpp_type(Person$email, TRUE)

# Get the label of a field descriptor
label(Person$id)
label(Person$email)
label(Person$phone)
label(Person$id, TRUE)
label(Person$email, TRUE)
label(Person$phone, TRUE)
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED

# Test if a field is optional
is_optional(Person$id)
is_optional(Person$email)
is_optional(Person$phone)

# Test if a field is repeated
is_repeated(Person$id)
is_repeated(Person$email)
is_repeated(Person$phone)

# Test if a field is required
is_required(Person$id)
is_required(Person$email)
is_required(Person$phone)

# Return the class of a message field
message_type(Person$phone)



