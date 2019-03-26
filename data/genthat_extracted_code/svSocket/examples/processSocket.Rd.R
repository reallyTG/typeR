library(svSocket)


### Name: processSocket
### Title: The function that processes a command coming from the socket
### Aliases: processSocket
### Keywords: IO

### ** Examples

## Not run: 
##D ## A simple REPL (R eval/process loop) using basic features of processSocket()
##D repl <- function ()
##D {
##D 	pars <- parSocket("repl", "", bare = FALSE)  # Parameterize the loop
##D 	cat("Enter R code, hit <CTRL-C> or <ESC> to exit\n> ")   # First prompt
##D 	repeat {
##D 		entry <- readLines(n = 1) 				 # Read a line of entry
##D 		if (entry == "") entry <- "<<<esc>>>"    # Exit from multiline mode
##D 		cat(processSocket(entry, "repl", ""))    # Process the entry
##D 	}
##D }
##D repl()
## End(Not run)



