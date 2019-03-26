library(RcppMsgPack)


### Name: msgpack_unpack
### Title: 'MsgPack' Unpack
### Aliases: msgpack_unpack msgpackUnpack

### ** Examples

x <- msgpack_format(1:10)
x_packed <- msgpack_pack(x)
x_unpacked <- msgpack_unpack(x_packed)
x_simplified <- msgpack_simplify(x_unpacked)



