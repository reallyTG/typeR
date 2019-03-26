library(rzmq)


### Name: bind.socket
### Title: Create an endpoint for accepting connections and bind it to the
###   socket referenced by the socket argument.
### Aliases: bind.socket
### Keywords: utilities

### ** Examples
## Not run: 
##D 
##D library(rzmq)
##D context = init.context()
##D in.socket = init.socket(context,"ZMQ_PULL")
##D bind.socket(in.socket,"tcp://*:5557")
##D 
##D out.socket = init.socket(context,"ZMQ_PUSH")
##D bind.socket(out.socket,"tcp://*:5558")
## End(Not run)


