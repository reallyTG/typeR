library(rstackdeque)


### Name: as.rdeque
### Title: Create a pre-filled rdeque from a given input
### Aliases: as.rdeque

### ** Examples

d <- as.rdeque(1:20)
print(d)

d <- as.rdeque(1:200000)
print(d)

## A deck with only 5 elements, one for each column
oops <- as.rdeque(iris)
print(oops)



