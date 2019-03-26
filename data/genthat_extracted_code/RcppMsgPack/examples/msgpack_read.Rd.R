library(RcppMsgPack)


### Name: msgpack_read
### Title: 'MsgPack' read
### Aliases: msgpack_read msgpackRead

### ** Examples

tmp <- tempfile(fileext=".gz")
msgpack_write(1:10, file=tmp)
x <- msgpack_read(tmp, simplify=TRUE)



