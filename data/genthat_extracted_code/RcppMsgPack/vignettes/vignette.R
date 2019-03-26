## ------------------------------------------------------------------------
library(RcppMsgPack)
library(microbenchmark)

x <- 1:1e6
microbenchmark(xpk <- msgpack_pack(x), times=3)
microbenchmark(xu <- msgpack_unpack(xpk), times=3)

