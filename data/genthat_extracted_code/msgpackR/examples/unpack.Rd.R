library(msgpackR)


### Name: unpack
### Title: unserialize MessagePack format data
### Aliases: unpack
### Keywords: ~kwd1 ~kwd2

### ** Examples

unpack(pack(c(1,2,3)))
#[1] 1 2 3
(data <- c(1,2,3))
#[1] 1 2 3
(d <- pack(data))
#[1] 93 01 02 03
msgpack.writeResult("test.txt", d)
unpack("test.txt")  # <= unserialize from binary file
#[1] 1 2 3
unpack(d) # <= unserialize from binary bits
#[1] 1 2 3



