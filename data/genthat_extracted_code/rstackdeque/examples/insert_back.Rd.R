library(rstackdeque)


### Name: insert_back
### Title: Insert an element into the back of an rdeque or rpqueue
### Aliases: insert_back

### ** Examples

d <- rdeque()
d <- insert_back(d, "a")
d <- insert_back(d, "b")
print(d)

d2 <- insert_back(d, "c")
print(d2)
print(d)



