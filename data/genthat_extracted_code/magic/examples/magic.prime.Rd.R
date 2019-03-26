library(magic)


### Name: magic.prime
### Title: Magic squares prime order
### Aliases: magic.prime
### Keywords: array

### ** Examples

magic.prime(7)
f <- function(n){is.magic(magic.prime(n))}
all(sapply(6*1:30+1,f))
all(sapply(6*1:30-1,f))

is.magic(magic.prime(9,i=2,j=4),give.answers=TRUE)
magic.prime(7,i=2,j=4)



