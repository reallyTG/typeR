library(pbdZMQ)


### Name: Message Function
### Title: Message Functions
### Aliases: 'Message Function' zmq.msg.send zmq.msg.recv
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
##D buf <- zmq.msg.recv(responder)
##D set.seed(1234)
##D ret <- rnorm(5)
##D print(ret)
##D zmq.msg.send(ret, responder)
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
##D zmq.msg.send(NULL, requester)
##D ret <- zmq.msg.recv(requester)
##D print(ret)
##D zmq.close(requester)
##D zmq.ctx.destroy(context)
## End(Not run)




