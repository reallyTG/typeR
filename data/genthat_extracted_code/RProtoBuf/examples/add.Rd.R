library(RProtoBuf)


### Name: add-methods
### Title: add elements of a repeated field of a message
### Aliases: add add-methods add,Message-method
### Keywords: methods

### ** Examples

unitest.proto.file <- system.file("unitTests", "data", "unittest.proto",
				  package = "RProtoBuf" )
readProtoFiles(file = unitest.proto.file)

test <- new(protobuf_unittest.TestAllTypes)
test$add("repeated_int32", 1)
test$add("repeated_int32", 2:10)
test$repeated_int32



