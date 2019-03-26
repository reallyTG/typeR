library(RProtoBuf)


### Name: FileDescriptor-class
### Title: Class "FileDescriptor"
### Aliases: FileDescriptor-class as.character,FileDescriptor-method
###   toString,FileDescriptor-method $,FileDescriptor-method
###   show,FileDescriptor-method name,FileDescriptor-method
### Keywords: classes

### ** Examples

# example proto file supplied with this package
desc <- P("tutorial.Person")
person <- new(desc)

person$fileDescriptor()
name(person$fileDescriptor())
# [1] "addressbook.proto"
as.character(person$fileDescriptor())



