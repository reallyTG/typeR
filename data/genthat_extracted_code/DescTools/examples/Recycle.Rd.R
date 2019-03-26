library(DescTools)


### Name: Recycle
### Title: Recyle a List of Elements
### Aliases: Recycle
### Keywords: utilities

### ** Examples

Recycle(x=1:5, y=1, s=letters[1:2])

z <- Recycle(x=letters[1:5], n=2:3, sep=c("-"," "))
sapply(1:attr(z, "maxdim"), function(i) paste(rep(z$x[i], times=z$n[i]), collapse=z$sep[i]))



