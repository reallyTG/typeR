library(svSocket)


### Name: evalServer
### Title: Evaluate R code in a server process
### Aliases: evalServer
### Keywords: IO utilities

### ** Examples

## Not run: 
##D ## Start an R process and make it a server
##D require(svSocket)
##D startSocketServer()
##D 
##D ## Start a second R process and run this code in it (the R client):
##D require(svSocket)
##D 
##D ## Connect with the R socket server
##D con <- socketConnection(host = "localhost", port = 8888, blocking = FALSE)
##D 
##D L <- 10:20
##D L
##D evalServer(con, L)             # L is not an the server, hence the error
##D evalServer(con, L, L)          # Send it to the server
##D evalServer(con, L)             # Now it is there
##D evalServer(con, L, L + 2)
##D L
##D evalServer(con, L)
##D 
##D ## More examples
##D evalServer(con, "x <- 42")     # Set x
##D evalServer(con, "y <- 10")     # Set y
##D evalServer(con, x + y)         # Don't need quotes
##D evalServer(con, "x + y")       # but you can put quotes if you like
##D evalServer(con, x)             # Same as get x
##D evalServer(con, "x + Y")       # Return server side-error to the client
##D evalServer(con, x)             # Keep working after an error
##D evalServer(con, "x <- 'a'")    # Embedded quotes are OK
##D 
##D ## Examples of sending data
##D evalServer(con, X, -42)        # Alternative way to assign to X
##D evalServer(con, Y, 1:10)
##D evalServer(con, X + Y)
##D X  # Generates an error, X is not here in the client, only on the server
##D evalServer(con, X)
##D evalServer(con, "Z <- X + 3")  # Send an assignment to execute remotely
##D evalServer(con, X + Z)
##D evalServer(con, "Z <- X + 1:1000; NULL")   # Same but prevents Y being returned
##D evalServer(con, length(Z))
##D Z <- evalServer(con, Z)        # Bring it back to client
##D Z
##D 
##D ## Close connection with the R socket server
##D close(con)
##D 
##D ## Now, switch back to the R server process and check
##D ## that the created variables are there
##D L
##D x
##D y
##D X
##D Y
##D Z
##D 
##D ## Stop the socket server
##D stopSocketServer()
## End(Not run)



