library(circular)


### Name: c.circular
### Title: A method for circular object, which combines its arguments
### Aliases: c.circular
### Keywords: manip

### ** Examples


x <- rvonmises(10, circular(0), 10)
y <- rvonmises(10, circular(0), 10, control.circular=list(units="degrees"))
z <- runif(10, 0, 20) # here you do not use circular properties, 
#####but you mean it is measured in degrees
c(x, y, z) # While y is converted in radians, z is treated as it was!




