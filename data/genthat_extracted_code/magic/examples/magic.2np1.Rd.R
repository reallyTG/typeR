library(magic)


### Name: magic.2np1
### Title: Magic squares of odd order
### Aliases: magic.2np1
### Keywords: array

### ** Examples

magic.2np1(1)
f <- function(n){is.magic(magic.2np1(n))}
all(sapply(1:20,f))

is.panmagic(magic.2np1(5,ord.vec=c(2,1),break.vec=c(1,3)))



