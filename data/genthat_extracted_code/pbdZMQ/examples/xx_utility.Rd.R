library(pbdZMQ)


### Name: Utility Functions
### Title: Utility Functions
### Aliases: 'Utility Functions' zmq.strerror zmq.version
### Keywords: internal

### ** Examples

## Not run: 
##D library(pbdZMQ, quietly = TRUE)
##D 
##D context <- zmq.ctx.new()
##D zmq.ctx.destroy(context)
##D zmq.strerror(0)
##D 
##D zmq.ctx.destroy(context) # Error since context is free.
##D zmq.strerror(14)
## End(Not run)




