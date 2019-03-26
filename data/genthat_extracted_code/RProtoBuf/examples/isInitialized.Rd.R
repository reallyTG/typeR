library(RProtoBuf)


### Name: isInitialized-methods
### Title: Indicates if a protocol buffer message is initialized
### Aliases: isInitialized isInitialized-methods
###   isInitialized,Message-method
### Keywords: methods

### ** Examples

message <- new( tutorial.Person, name = "" )
isInitialized( message ) # FALSE (id is not set)
message$isInitialized()  # FALSE

message <- new( tutorial.Person, name = "", id = 2 )
isInitialized( message ) # TRUE
message$isInitialized()  # TRUE




