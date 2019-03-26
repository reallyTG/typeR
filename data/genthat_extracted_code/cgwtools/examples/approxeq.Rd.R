library(cgwtools)


### Name: approxeq
### Title: Do "fuzzy" equality and return a logical vector.
### Aliases: approxeq

### ** Examples

x<-1:10
y<-x+runif(10)*1e-6
approxeq(x,y) #all FALSE
approxeq(x,y,tolerance=1e-5) #mostly TRUE, probably



