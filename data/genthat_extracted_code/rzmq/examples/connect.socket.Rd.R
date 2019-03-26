library(rzmq)


### Name: connect.socket
### Title: Connect the socket referenced by the socket argument to the
###   endpoint specified by the endpoint argument.
### Aliases: connect.socket disconnect.socket
### Keywords: utilities

### ** Examples
## Not run: 
##D library(rzmq)
##D context = init.context()
##D in.socket = init.socket(context,"ZMQ_PULL")
##D bind.socket(in.socket,"tcp://*:5557")
##D 
##D out.socket = init.socket(context,"ZMQ_PUSH")
##D bind.socket(out.socket,"tcp://*:5558")
## End(Not run)


