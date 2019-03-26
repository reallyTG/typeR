library(RProtoBuf)


### Name: serialize_pb
### Title: Serialize R object to Protocol Buffer Message.
### Aliases: can_serialize_pb serialize_pb unserialize_pb

### ** Examples

msg <- tempfile();
serialize_pb(iris, msg);
obj <- unserialize_pb(msg);
identical(iris, obj);




