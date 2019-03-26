library(ff)


### Name: repnam
### Title: Replicate with names
### Aliases: repnam
### Keywords: utilities

### ** Examples

 message("a list example")
 repnam(list(y=c(1,2), z=3), letters)
 repnam(list(c(1,2), 3), letters)

 message("a vector example")
 repnam(c(y=1, z=3), letters, default=NA)
 repnam(c(1, 3), letters, default=NA)




