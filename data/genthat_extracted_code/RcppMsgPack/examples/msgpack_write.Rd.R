library(RcppMsgPack)


### Name: msgpack_write
### Title: 'MsgPack' write
### Aliases: msgpack_write msgpackWrite

### ** Examples

tmp <- tempfile(fileext=".gz")
msgpack_write(1:10, file=tmp)
x <- msgpack_read(tmp, simplify=TRUE)



