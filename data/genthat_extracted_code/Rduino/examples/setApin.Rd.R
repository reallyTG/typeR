library(Rduino)


### Name: setApin
### Title: Set analog pin
### Aliases: setApin

### ** Examples

## Not run: 
##D rduinoConnect()
##D # gradually increase intensity of LED
##D for (i in seq(1,256,by=5)) 
##D {
##D   setApin(11,i)
##D   Sys.sleep(0.05)
##D }
##D rduinoClose()
## End(Not run)




