library(rstackdeque)


### Name: without_back.rdeque
### Title: Return a version of an rdeque without the back element
### Aliases: without_back.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
d <- insert_front(d, "c")

d2 <- without_back(d)
print(d2)

d3 <- without_back(d)
print(d3)

print(d)



