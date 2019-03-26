library(rzmq)


### Name: socket.options
### Title: set a socket option.
### Aliases: set.hwm set.swap set.affinity set.identity subscribe
###   unsubscribe set.rate set.recovery.ivl set.recovery.ivl.msec
###   set.mcast.loop set.sndbuf set.rcvbuf set.linger set.reconnect.ivl
###   set.zmq.backlog set.reconnect.ivl.max get.rcvmore get.send.timeout
###   set.send.timeout
### Keywords: utilities

### ** Examples
## Not run: 
##D 
##D library(rzmq)
##D context = init.context()
##D socket = init.socket(context,"ZMQ_REQ")
##D 
##D set.hwm(socket, 1L)
##D set.swap(socket, 100L)
##D set.identity(socket, "big.ass.socket")
## End(Not run)


