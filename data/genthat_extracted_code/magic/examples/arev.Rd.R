library(magic)


### Name: arev
### Title: Reverses some dimensions; a generalization of rev
### Aliases: arev
### Keywords: array

### ** Examples

a <- matrix(1:42,6,7)
arev(a)  #Note swap defaults to TRUE

b <- magichypercube.4n(1,d=4)
arev(b,c(TRUE,FALSE,TRUE,FALSE))



