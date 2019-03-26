library(processx)


### Name: poll
### Title: Poll for process I/O or termination
### Aliases: poll

### ** Examples

## Different commands to run for windows and unix
## Not run: 
##D cmd1 <- switch(
##D   .Platform$OS.type,
##D   "unix" = c("sh", "-c", "sleep 1; ls"),
##D   c("cmd", "/c", "ping -n 2 127.0.0.1 && dir /b")
##D )
##D cmd2 <- switch(
##D   .Platform$OS.type,
##D   "unix" = c("sh", "-c", "sleep 2; ls 1>&2"),
##D   c("cmd", "/c", "ping -n 2 127.0.0.1 && dir /b 1>&2")
##D )
##D 
##D ## Run them. p1 writes to stdout, p2 to stderr, after some sleep
##D p1 <- process$new(cmd1[1], cmd1[-1], stdout = "|")
##D p2 <- process$new(cmd2[1], cmd2[-1], stderr = "|")
##D 
##D ## Nothing to read initially
##D poll(list(p1 = p1, p2 = p2), 0)
##D 
##D ## Wait until p1 finishes. Now p1 has some output
##D p1$wait()
##D poll(list(p1 = p1, p2 = p2), -1)
##D 
##D ## Close p1's connection, p2 will have output on stderr, eventually
##D close(p1$get_output_connection())
##D poll(list(p1 = p1, p2 = p2), -1)
##D 
##D ## Close p2's connection as well, no nothing to poll
##D close(p2$get_error_connection())
##D poll(list(p1 = p1, p2 = p2), 0)
## End(Not run)



