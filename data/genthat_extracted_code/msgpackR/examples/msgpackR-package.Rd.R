library(msgpackR)


### Name: msgpackR-package
### Title: A library to serialize or deserialize data in MessagePack format
### Aliases: msgpackR-package msgpackR
### Keywords: package

### ** Examples

(data <- c(1,2,3))
#[1] 1 2 3
(d <- pack(data))
#[1] 93 01 02 03
msgpack.writeResult("test.txt", d)
unpack("test.txt")  # <= unserialize from binary file
#[1] 1 2 3
unpack(d)  # <= unserialize from binary bits
#[1] 1 2 3

# example to serialize {"compact":true}, which appears at http://msgpack.org/.
sample <- TRUE
names(sample) <- c("compact")
sample
#compact 
#   TRUE 
pack(sample)
#[1] 81 a7 63 6f 6d 70 61 63 74 c3 

# Positive FixNum
a <- 100
pack(a)
#[1] 64
unpack(pack(a))
#[1] 100

# uint16
a <- 2^10
pack(a)
#[1] cd 04 00
unpack(pack(a))
#[1] 1024

# int16
a <- -2^10
pack(a)
#[1] d1 fc 00
unpack(pack(a))
#[1] -1024

# double
a <- 10.1
pack(a)
#[1] cb 40 24 33 33 33 33 33 33
unpack(pack(a))
#[1] 10.1

# FixRaw
a <- "sample character"
pack(a)
#[1] b0 73 61 6d 70 6c 65 20 63 68 61 72 61 63 74 65 72
unpack(pack(a))
#[1] "sample character"




