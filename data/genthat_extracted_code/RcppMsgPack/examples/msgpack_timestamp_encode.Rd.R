library(RcppMsgPack)


### Name: msgpack_timestamp_encode
### Title: 'MsgPack' Timestamp
### Aliases: msgpack_timestamp_encode msgpackTimestampEncode

### ** Examples

mt <- Sys.time()
attr(mt, "tzone") <- "UTC"
mp <- msgpack_pack(msgpack_timestamp_encode(mt))
mtu <- msgpack_timestamp_decode(msgpack_unpack(mp))
identical(mt, mtu)



