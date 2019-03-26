library(rstudioapi)


### Name: terminalExecute
### Title: Execute Command
### Aliases: terminalExecute

### ** Examples

## Not run: 
##D termId <- rstudioapi::terminalExecute(
##D   command = 'echo $HELLO && echo $WORLD',
##D   workingDir = '/usr/local',
##D   env = c('HELLO=WORLD', 'WORLD=EARTH'),
##D   show = FALSE)
##D 
##D while (is.null(rstudioapi::terminalExitCode(termId))) {
##D   Sys.sleep(0.1)
##D }
##D 
##D result <- terminalBuffer(termId)
##D terminalKill(termId)
##D print(result)
## End(Not run)




