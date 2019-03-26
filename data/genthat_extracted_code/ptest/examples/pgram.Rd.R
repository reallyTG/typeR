library(ptest)


### Name: pgram
### Title: Periodogram computation
### Aliases: pgram
### Keywords: ts

### ** Examples

z<-sunspot.year
n<-length(z) 
I<-pgram(z)
f<-I[,1]
I <- I[,2]
plot(f, I, xlab="f", ylab="f", type="l") 
title(main="Periodogram for Annual Sunpots, 1700-1988") 
#
z<-c(0.42, 0.89, 1.44, 1.98, 2.21, 2.04, 0.82, 0.62, 0.56, 0.8, 1.33)
fr <- (1:50)/101
pgram(z)
pgram(z, fr=101)
pgram(z, fr=fr)
pgram(z, method="regression")
pgram(z, method="regression", fr=101)
pgram(z, method="regression", fr=fr)
  
                                                        



