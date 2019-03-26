library(RProtoBuf)


### Name: containing_type-methods
### Title: Gets the message type descriptor that contains a descriptor
### Aliases: containing_type containing_type-methods
### Keywords: methods

### ** Examples

# Containing type of a field is the message descriptor
tutorial.Person$id$containing_type()

# No containing type for the top-level message descriptor.
tutorial.Person$containing_type()



