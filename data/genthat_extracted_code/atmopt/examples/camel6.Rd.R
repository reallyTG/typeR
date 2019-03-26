library(atmopt)


### Name: camel6
### Title: Six-hump discrete test function
### Aliases: camel6

### ** Examples

xx <- c(1,2,1,2,1,2) #input factors
nlev <- rep(4,length(xx)) #number of levels for each factor
ntimes <- length(xx)/2 #base function is in 2D, so duplicate 3 times
camel6(xx,ntimes,nlev)



