library(rstackdeque)


### Name: as.list.rdeque
### Title: Convert an rdeque to a list
### Aliases: as.list.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")

dlist <- as.list(d)
print(dlist)



