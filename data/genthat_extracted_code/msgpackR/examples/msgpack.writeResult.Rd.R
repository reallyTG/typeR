library(msgpackR)


### Name: msgpack.writeResult
### Title: the function to save serialized data to file
### Aliases: msgpack.writeResult
### Keywords: ~kwd1 ~kwd2

### ** Examples

(data <- c(1,2,3))
#[1] 1 2 3
(d <- pack(data))
#[1] 93 01 02 03
msgpack.writeResult("test.txt", d)



