library(rzmq)


### Name: poll.socket
### Title: Polls a list of sockets, waiting for the presence of a
###   nonblocking read, write, or error event.
### Aliases: poll.socket
### Keywords: utilities

### ** Examples
## Not run: 
##D library(rzmq)
##D 
##D # Create a set of REP-REQ sockets that
##D # have a Send, Receive, Send, Receive, ...
##D # pattern.
##D context = init.context()
##D in.socket = init.socket(context,"ZMQ_REP")
##D bind.socket(in.socket,"tcp://*:5557")
##D 
##D out.socket = init.socket(context,"ZMQ_REQ")
##D connect.socket(out.socket,"tcp://*:5557")
##D 
##D # Poll the REP and REQ sockets for all events.
##D events <- poll.socket(list(in.socket, out.socket),
##D                       list(c("read", "write", "error"),
##D                            c("read", "write", "error")),
##D                       timeout=0L)
##D 
##D # The REQ socket is writable without blocking.
##D paste("Is upstream REP socket readable without blocking?", events[[1]]$read)
##D paste("Is upstream REP socket writable without blocking?", events[[1]]$write)
##D paste("Is downstream REQ socket readable without blocking?", events[[2]]$read)
##D paste("Is downstream REQ socket writable without blocking?", events[[2]]$write)
##D 
##D # Send a message to the REP socket from the REQ socket. The
##D # REQ socket must respond before the REP socket can send
##D # another message.
##D send.socket(out.socket, "Hello World")
##D 
##D events <- poll.socket(list(in.socket, out.socket),
##D                       list(c("read", "write", "error"),
##D                            c("read", "write", "error")),
##D                       timeout=0L)
##D 
##D # The incoming message is readable on the REP socket.
##D paste("Is upstream REP socket readable without blocking?", events[[1]]$read)
##D paste("Is upstream REP socket writable without blocking?", events[[1]]$write)
##D paste("Is downstream REQ socket readable without blocking?", events[[2]]$read)
##D paste("Is downstream REQ socket writable without blocking?", events[[2]]$write)
##D 
##D receive.socket(in.socket)
##D 
##D events <- poll.socket(list(in.socket, out.socket),
##D                       list(c("read", "write", "error"),
##D                            c("read", "write", "error")),
##D                       timeout=0L)
##D 
##D # The REQ socket is waiting for a response from the REP socket. 
##D paste("Is upstream REP socket readable without blocking?", events[[1]]$read)
##D paste("Is upstream REP socket writable without blocking?", events[[1]]$write)
##D paste("Is downstream REQ socket readable without blocking?", events[[2]]$read)
##D paste("Is downstream REQ socket writable without blocking?", events[[2]]$write)
##D 
##D send.socket(in.socket, "Greetings")
##D 
##D events <- poll.socket(list(in.socket, out.socket),
##D                       list(c("read", "write", "error"),
##D                            c("read", "write", "error")),
##D                       timeout=0L)
##D 
##D # The REP response is waiting to be read on the REQ socket.
##D paste("Is upstream REP socket readable without blocking?", events[[1]]$read)
##D paste("Is upstream REP socket writable without blocking?", events[[1]]$write)
##D paste("Is downstream REQ socket readable without blocking?", events[[2]]$read)
##D paste("Is downstream REQ socket writable without blocking?", events[[2]]$write)
##D 
##D # Complete the REP-REQ transaction cycle by reading
##D # the REP response.
##D receive.socket(out.socket)
## End(Not run)


