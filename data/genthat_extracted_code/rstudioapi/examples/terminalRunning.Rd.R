library(rstudioapi)


### Name: terminalRunning
### Title: Is Terminal Running
### Aliases: terminalRunning

### ** Examples

## Not run: 
##D # termId has a handle to a previously created terminal
##D # make sure it is still running before we send it a command
##D if (!rstudioapi::terminalRunning(termId)) {
##D    rstudioapi::terminalActivate(termId))
##D 
##D    # wait for it to start
##D    while (!rstudioapi::terminalRunning(termId)) {
##D       Sys.sleep(0.1)
##D    }
##D 
##D    terminalSend(termId, "echo Hello\n")
##D }
## End(Not run)



