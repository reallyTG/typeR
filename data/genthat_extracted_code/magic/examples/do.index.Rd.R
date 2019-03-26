library(magic)


### Name: do.index
### Title: Apply a function to array element indices
### Aliases: do.index
### Keywords: math

### ** Examples

a <- array(0,c(2,3,4))
b <- array(rpois(60,1),c(3,4,5))

f1 <- function(x){sum(x)}
f2 <- function(x){sum((x-1)^2)}
f3 <- function(x){b[t(x)]}
f4 <- function(x){sum(x)%%2}
f5 <- function(x,u){x[u]}

do.index(a,f1)    # should match   arow(a,1)+arow(a,2)+arow(a,3)
do.index(a,f2)
do.index(a,f3)    # same as  apltake(b,dim(a))
do.index(a,f4)    # Male/female toilets at NOC
do.index(a,f5,2)  # same as  arow(a,2)



