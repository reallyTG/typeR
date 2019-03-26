library(Rduino)


### Name: setDpin
### Title: Set digital pin
### Aliases: setDpin

### ** Examples

## Not run: 
##D rduinoConnect()
##D # flash LED rapidly
##D for (i in 0:9) 
##D {
##D   setDpin(8,1)
##D   Sys.sleep(0.05)
##D   setDpin(8,0)
##D   Sys.sleep(0.05)
##D }
##D rduinoClose()
## End(Not run)




