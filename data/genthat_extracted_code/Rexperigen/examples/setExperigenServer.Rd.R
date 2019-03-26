library(Rexperigen)


### Name: setExperigenServer
### Title: Sets the Experigen server address for further operations. By
###   default, it checks the existence of the server and sets the
###   'Rexperigen.server.version' option based on the response of the
###   server. If 'check = FALSE', set the version by yourself!
### Aliases: setExperigenServer

### ** Examples

setExperigenServer("db.phonologist.org")
setExperigenServer("localhost:3000", FALSE)




