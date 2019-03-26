library(RcppMsgPack)


### Name: msgpack_map
### Title: 'MsgPack' Map
### Aliases: msgpack_map msgpackMap

### ** Examples

x <- msgpack_map(key=letters[1:10], value=1:10)
x_packed <- msgpack_pack(x)
x_unpacked <- msgpack_unpack(x_packed)



