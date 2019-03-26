library(magic)


### Name: lozenge
### Title: Conway's lozenge algorithm for magic squares
### Aliases: lozenge
### Keywords: array

### ** Examples

lozenge(4)
all(sapply(1:10,function(n){is.magic(lozenge(n))}))



