library(rstudioapi)


### Name: terminalBusy
### Title: Is Terminal Busy
### Aliases: terminalBusy

### ** Examples

## Not run: 
##D # create a hidden terminal and run a lengthy command
##D termId <- rstudioapi::terminalCreate(show = FALSE)
##D rstudioapi::terminalSend(termId, "sleep 5\n")
##D 
##D # wait until a busy terminal is finished
##D while (rstudioapi::terminalBusy(termId)) {
##D   Sys.sleep(0.1)
##D }
##D print("Terminal available")
## End(Not run)



