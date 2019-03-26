library(pbdZMQ)


### Name: Send Receive Functions
### Title: Send Receive Functions
### Aliases: 'Send Receive Functions' zmq.send zmq.recv
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
##D for(i.res in 1:5){
##D   buf <- zmq.recv(responder, 10L)
##D   cat(buf$buf, "\n")
##D   Sys.sleep(0.5)
##D   zmq.send(responder, "World")
##D }
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
##D for(i.req in 1:5){
##D   cat("Sending Hello ", i.req, "\n")
##D   zmq.send(requester, "Hello")
##D   buf <- zmq.recv(requester, 10L)
##D   cat("Received World ", i.req, "\n")
##D }
##D zmq.close(requester)
##D zmq.ctx.destroy(context)
## End(Not run)




