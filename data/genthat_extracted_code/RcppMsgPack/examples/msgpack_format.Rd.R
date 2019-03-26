library(RcppMsgPack)


### Name: msgpack_format
### Title: Format data for 'MsgPack'
### Aliases: msgpack_format msgpackFormat

### ** Examples

x <- msgpack_format(1:10)
x_packed <- msgpack_pack(x)
x_unpacked <- msgpack_unpack(x_packed)
x_simplified <- msgpack_simplify(x_unpacked)



