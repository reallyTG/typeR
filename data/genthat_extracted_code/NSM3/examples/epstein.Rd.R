library(NSM3)


### Name: epstein
### Title: Epstein
### Aliases: epstein
### Keywords: epstein

### ** Examples

ex11.1<-c(42, 43, 51, 61, 66, 69, 71, 81, 82, 82)
Ep <- epstein(ex11.1, alt="ifr", exact=TRUE)
Ep$E
Ep$p

#Large Sample Approximation
Ep.lsa <- epstein(ex11.1, alt="ifr")




