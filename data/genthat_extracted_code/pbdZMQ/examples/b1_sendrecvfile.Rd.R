library(pbdZMQ)


### Name: File Transfer Functions
### Title: File Transfer Functions
### Aliases: 'File Transfer Functions' zmq.sendfile zmq.recvfile
### Keywords: programming

### ** Examples

## Not run: 
##D ### Run the sender and receiver code in separate R sessions.
##D 
##D # Receiver
##D library(pbdZMQ, quietly = TRUE)
##D zmq.recvfile(55555, "localhost", "/tmp/outfile", verbose=TRUE)
##D 
##D # Sender
##D library(pbdZMQ, quietly = TRUE)
##D zmq.sendfile(55555, "/tmp/infile", verbose=TRUE)
## End(Not run)




