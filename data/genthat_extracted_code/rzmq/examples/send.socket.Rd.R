library(rzmq)


### Name: send.socket
### Title: send a message.
### Aliases: send.socket send.null.msg send.raw.string send.message.object
### Keywords: utilities

### ** Examples
## Not run: 
##D 
##D ## remote execution server in rzmq
##D library(rzmq)
##D context = init.context()
##D in.socket = init.socket(context,"ZMQ_PULL")
##D bind.socket(in.socket,"tcp://*:5557")
##D 
##D out.socket = init.socket(context,"ZMQ_PUSH")
##D bind.socket(out.socket,"tcp://*:5558")
##D 
##D while(1) {
##D    msg = receive.socket(in.socket)
##D    fun <- msg$fun
##D    args <- msg$args
##D    print(args)
##D    ans <- do.call(fun,args)
##D    send.socket(out.socket,ans)
##D }
## End(Not run)


