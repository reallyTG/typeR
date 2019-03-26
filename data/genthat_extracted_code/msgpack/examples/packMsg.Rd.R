library(msgpack)


### Name: packMsg
### Title: Convert R objects to msgpack format.
### Aliases: packMsg packMsgs packOpts prepack prepack.default
###   prepack.data.frame

### ** Examples

packMsg( list(compact=TRUE, schema=0) )
x <- packMsgs(list("one", "two", "three"))
unpackMsgs(x, 2)



