library(gtools)


### Name: setTCPNoDelay
### Title: Modify the TCP\_NODELAY ('de-Nagle') flag for socket objects
### Aliases: setTCPNoDelay
### Keywords: programming misc utilities

### ** Examples

## Not run: 
##D host <- "www.r-project.org"
##D socket <- make.socket(host, 80)
##D print(socket)
##D setTCPNoDelay(socket, TRUE)
##D 
##D write.socket(socket, "GET /\n\n")
##D write.socket(socket, "A")
##D write.socket(socket, "B\n")
##D while( (str <- read.socket(socket)) > "")
##D   cat(str)
##D close.socket(socket)
## End(Not run)




