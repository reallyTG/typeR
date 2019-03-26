library(wavethresh)


### Name: summary.wd3D
### Title: Print out some basic information associated with a wd3D object
### Aliases: summary.wd3D
### Keywords: print

### ** Examples

test.data.3D <- array(rnorm(8*8*8), dim=c(8,8,8))
tdwd3D <- wd3D(test.data.3D)
summary(tdwd3D)
#Levels:  3 
#Filter number was:  10 
#Filter family was:  DaubLeAsymm 
#Date:  Mon Mar  8 21:48:00 2010 



