library(pbdZMQ)


### Name: Socket Functions
### Title: Socket Functions
### Aliases: 'Socket Functions' zmq.socket zmq.close zmq.bind zmq.connect
###   zmq.disconnect zmq.setsockopt zmq.getsockopt
### Keywords: programming

### ** Examples

## Not run: 
##D ### Using request-reply pattern.
##D 
##D ### At the server, run next in background or the other windows.
##D library(pbdZMQ, quietly = TRUE)
##D 
##D context <- zmq.ctx.new()
##D responder <- zmq.socket(context, .pbd_env$ZMQ.ST$REP)
##D zmq.bind(responder, "tcp://*:5555")
##D zmq.close(responder)
##D zmq.ctx.destroy(context)
##D 
##D 
##D ### At a client, run next in foreground.
##D library(pbdZMQ, quietly = TRUE)
##D 
##D context <- zmq.ctx.new()
##D requester <- zmq.socket(context, .pbd_env$ZMQ.ST$REQ)
##D zmq.connect(requester, "tcp://localhost:5555")
##D zmq.close(requester)
##D zmq.ctx.destroy(context)
## End(Not run)




