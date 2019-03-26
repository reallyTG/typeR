library(RProtoBuf)


### Name: asMessage
### Title: coerce an object to a protobuf message
### Aliases: asMessage
### Keywords: programming

### ** Examples

# coerce a message type descriptor to a message
asMessage( tutorial.Person )

# coerce a enum descriptor
asMessage( tutorial.Person.PhoneType )

# coerce a field descriptor
asMessage( tutorial.Person$email )

# coerce a file descriptor 
asMessage( fileDescriptor( tutorial.Person ) )



