library(pbdZMQ)


### Name: Send Receive Multiple Raw Buffers
### Title: Send Receive Multiple Raw Buffers
### Aliases: 'Send Receive Multiple Raw Buffers' zmq.send.multipart
###   zmq.recv.multipart
### Keywords: programming

### ** Examples

## Not run: 
##D ### Using request-reply pattern.
##D 
##D ### At the server, run next in background or the other window.
##D library(pbdZMQ, quietly = TRUE)
##D 
##D context <- zmq.ctx.new()
##D responder <- zmq.socket(context, .pbd_env$ZMQ.ST$REP)
##D zmq.bind(responder, "tcp://*:5555")
##D 
##D ret <- zmq.recv.multipart(responder, unserialize = TRUE)
##D parts <- as.list(rep("World", 5))
##D zmq.send.multipart(responder, parts)
##D for(i in 1:5) cat(ret[[i]])
##D 
##D zmq.close(responder)
##D zmq.ctx.destroy(context)
##D 
##D ### At a client, run next in foreground.
##D library(pbdZMQ, quietly = TRUE)
##D 
##D context <- zmq.ctx.new()
##D requester <- zmq.socket(context, .pbd_env$ZMQ.ST$REQ)
##D zmq.connect(requester, "tcp://localhost:5555")
##D 
##D parts <- lapply(1:5, function(i.req){ paste("Sending Hello ", i.req, "\n") })
##D zmq.send.multipart(requester, parts)
##D ret <- zmq.recv.multipart(requester, unserialize = TRUE)
##D print(ret)
##D 
##D zmq.close(requester)
##D zmq.ctx.destroy(context)
## End(Not run)




