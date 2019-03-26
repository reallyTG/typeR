library(rzmq)


### Name: receive.socket
### Title: Receive a message from the socket referenced by the socket
###   argument.
### Aliases: receive.socket receive.null.msg receive.string receive.int
###   receive.double
### Keywords: utilities

### ** Examples
## Not run: 
##D library(rzmq)
##D 
##D remote.exec <- function(out.socket,in.socket,fun,...) {
##D     send.socket(out.socket,data=list(fun=fun,args=list(...)))
##D     receive.socket(in.socket)
##D }
##D 
##D context = init.context()
##D out.socket = init.socket(context,"ZMQ_PUSH")
##D bind.socket(out.socket,"tcp://*:5557")
##D 
##D in.socket = init.socket(context,"ZMQ_PULL")
##D bind.socket(in.socket,"tcp://*:5558")
##D 
##D 
##D myfun <- function(x) {
##D     sum(abs(x))
##D }
##D 
##D remote.exec(out.socket,in.socket,myfun,rnorm(1e3))
##D 
## End(Not run)


