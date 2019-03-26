library(msgpack)


### Name: msgConnection
### Title: Read and write msgpack formatted messages over R connections.
### Aliases: msgConnection close.msgConnection partial
###   partial.msgConnection readMsgs status status.msgConnection
###   seek.msgConnection readMsg writeMsg writeMsgs

### ** Examples

out <- rawConnection(raw(0), open="wb")
apply(quakes, 1, function(x) writeMsg(x, out))
length(rawConnectionValue(out))
inn <- msgConnection(rawConnection(rawConnectionValue(out), open="rb"))
readMsg(inn)
readMsgs(inn, 3)



