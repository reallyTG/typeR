library(rstackdeque)


### Name: rdeque
### Title: Create a new empty rdeque
### Aliases: rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
d <- insert_back(d, "c")
d <- insert_back(d, "d")
print(d)

d2 <- without_back(d)
print(d2)
print(d)

b <- peek_front(d)
print(b)



