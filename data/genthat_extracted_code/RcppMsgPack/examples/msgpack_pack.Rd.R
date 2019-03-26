library(RcppMsgPack)


### Name: msgpack_pack
### Title: 'MsgPack' Pack
### Aliases: msgpack_pack msgpackPack

### ** Examples

x <- msgpack_format(1:10)
x_packed <- msgpack_pack(x)
x_unpacked <- msgpack_unpack(x_packed)
x_simplified <- msgpack_simplify(x_unpacked)



