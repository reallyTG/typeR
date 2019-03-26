library(randtoolbox)


### Name: serial.test
### Title: the Serial test
### Aliases: serial.test
### Keywords: htest

### ** Examples

# (1) 
#
serial.test(runif(1000))
print( serial.test( runif(1000000), d=2, e=FALSE) )

# (2) 
#
serial.test(runif(5000), 5) 




