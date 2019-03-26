library(rstackdeque)


### Name: as.rstack
### Title: Create an rstack pre-filled from a given input
### Aliases: as.rstack

### ** Examples

s <- as.rstack(1:20)
print(s)

s <- as.rstack(1:200000)
print(s)

## A stack with only 5 elements, one for each column
oops <- as.rstack(iris)
print(oops)



