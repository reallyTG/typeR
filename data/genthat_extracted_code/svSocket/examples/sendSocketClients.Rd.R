library(svSocket)


### Name: sendSocketClients
### Title: Send data to one or more clients through a socket
### Aliases: sendSocketClients
### Keywords: IO

### ** Examples

## Not run: 
##D ## Start an R process (R#1) and make it a server
##D require(svSocket)
##D serverport <- 8888  # Port 8888 by default, but you can change it
##D startSocketServer(port = serverport)
##D 
##D 
##D ## Start a second R process (R#2) and run this code in it (the R client):
##D require(svSocket)
##D ## Connect with the R socket server
##D con <- socketConnection(host = "localhost", port = 8888, blocking = FALSE)
##D 
##D 
##D ## Now, go back to the server R#1
##D getSocketClients() # You should have one client registered
##D ## Send something to all clients from R#1
##D sendSocketClients("Hi there!")
##D 
##D 
##D ## Switch back to client R#2
##D ## Since the connection is not blocking, you have to read lines actively
##D readLines(con)
##D ## Note the final empty string indicating there is no more data
##D close(con) # Once done...
##D 
##D 
##D ## Switch to the R#1 server and close the server
##D stopSocketServer(port = serverport)
## End(Not run)



