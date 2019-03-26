library(RSelenium)


### Name: startServer
### Title: Start the standalone server.
### Aliases: startServer

### ** Examples

## Not run: 
##D selServ <- startServer()
##D # example of commandline passing
##D selServ <- startServer(
##D   args = c("-port 4455"),
##D   log = FALSE,
##D   invisible = FALSE
##D )
##D remDr <- remoteDriver(browserName = "chrome", port = 4455)
##D remDr$open()
##D # get the process id of the selenium binary
##D selServ$getpid()
##D # stop the selenium binary
##D selServ$stop()
## End(Not run)



