library(RProtoBuf)


### Name: as.list.Message
### Title: Grab the protocol buffer message as an R list
### Aliases: as.list.Message as.list.Descriptor as.list.EnumDescriptor
###   as.list.FileDescriptor as.list.ServiceDescriptor
### Keywords: programming

### ** Examples

Person <- P( "tutorial.Person" )
romain <- new( Person, email = "francoisromain@free.fr", id = 1 )
as.list( romain )
as.list( Person )
as.list( Person$PhoneType)



