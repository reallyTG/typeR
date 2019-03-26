library(Rduino)


### Name: getApin
### Title: Get analog pin
### Aliases: getApin

### ** Examples

## Not run: 
##D rduinoConnect()
##D # set position of servo to position of potentiometer
##D off<-getDpin(4)
##D while (!off) 
##D {
##D   angle<-getApin(5)
##D   angle<- 1.68 * angle + 575
##D   setServo(9,angle)
##D   off<-getDpin(4)
##D }
##D offServo()
##D 
##D rduinoClose()
## End(Not run)




