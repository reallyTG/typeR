library(atmopt)


### Name: detpep10exp
### Title: DetPep10Exp discrete test function
### Aliases: detpep10exp

### ** Examples

xx <- c(1,2,1,2,1,2) #input factors
nlev <- rep(4,length(xx)) #number of levels for each factor
ntimes <- length(xx)/3 #base function is in 2D, so duplicate 2 times
detpep10exp(xx,ntimes,nlev)



